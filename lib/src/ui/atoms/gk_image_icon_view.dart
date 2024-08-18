import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guptha_ui_kit/src/ui/atoms/gk_shimmer.dart';
import 'package:guptha_ui_kit/src/ui/ui_imports.dart';

class GkImageIconView extends StatelessWidget {
  final String? assetPath;
  final String? networkPath;
  final double? dScale;
  final double? dHeight;
  final double? dWidth;
  final Color? iconColor;
  final BoxFit fit;
  final double dBorderRadius;
  final bool showPlaceHolder;
  final bool isNetworkSvg;
  final String? semanticsValue;

  const GkImageIconView({
    super.key,
    this.assetPath,
    this.dScale,
    this.iconColor,
    this.dWidth,
    this.dHeight,
    this.networkPath,
    this.dBorderRadius = 0,
    this.fit = BoxFit.cover,
    this.showPlaceHolder = true,
    this.isNetworkSvg = false,
    this.semanticsValue = 'gk_icon',
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      value: semanticsValue,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(dBorderRadius),
        child: assetPath != null
            ? gkHelperImp.isSvg(assetPath!)
                ? SvgPicture.asset(
                    assetPath!,
                    height: dHeight,
                    width: dWidth,
                    fit: fit,
                    colorFilter: iconColor != null ? gkHelperImp.getSVGColor(iconColor!) : null,
                  )
                : Image.asset(
                    assetPath ?? "",
                    height: dHeight,
                    width: dWidth,
                    fit: fit,
                    scale: dScale,
                    color: iconColor,
                  )
            : (networkPath != null && networkPath!.isNotEmpty)
                ? isNetworkSvg
                    ? SvgPicture.network(
                        networkPath!,
                        height: dHeight,
                        width: dWidth,
                        fit: fit,
                        placeholderBuilder: (context) => showPlaceHolder
                            ? GkShimmer(
                                width: dWidth,
                                height: dHeight ?? double.infinity,
                              )
                            : const SizedBox.shrink(),
                        colorFilter: iconColor != null ? gkHelperImp.getSVGColor(iconColor!) : null,
                      )
                    : CachedNetworkImage(
                        imageUrl: networkPath!,
                        color: iconColor,
                        height: dHeight,
                        width: dWidth,
                        fit: fit,
                        errorWidget: (context, url, error) {
                          return GkShimmer(
                            width: dWidth,
                            height: dHeight ?? double.infinity,
                          );
                        },
                        placeholder: (context, url) => showPlaceHolder
                            ? GkShimmer(
                                width: dWidth,
                                height: dHeight ?? double.maxFinite,
                              )
                            : const SizedBox.shrink(),
                      )
                : Container(),
      ),
    );
  }
}
