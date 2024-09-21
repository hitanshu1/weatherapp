part of 'Views.dart';

/// list view builder
class ListViewBuilder extends StatelessWidget {
  /// item count
  final int? itemCount;

  /// item builder
  final Widget? Function(int index) item;

  /// scroll
  final ScrollPhysics? physics;

  /// shrinkWrap
  final bool shrinkWrap;

  ///is list loading
  final bool isLoading;
  /// loading tile height
  final double loadingTileHeight;

  /// constructor
  const ListViewBuilder(
      {super.key,
      required this.itemCount,
      required this.item,
      this.loadingTileHeight = 170,
      this.physics,
      this.shrinkWrap = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return AnimationLimiter(
          child: ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: SizeConfig.verticalTilePadding,
            child: AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50,
                   duration: const Duration(milliseconds: 275),
                    child: FadeInAnimation(
                      child: Container(
                              height: loadingTileHeight,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                            
                            )))),
          );
        },
      ));
    }
    if(itemCount==0){
      return Widgets.notFoundWidget();
    }
    return AnimationLimiter(child: 
    ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50,
              duration: const Duration(milliseconds: 275),
              child: FadeInAnimation(
                child: item(index)??Container(),
              ),
            ));
      },
    ));
  }
}
