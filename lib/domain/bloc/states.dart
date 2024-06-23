abstract class SlashStates {}

class SlashInitState extends SlashStates {}

class SlashGetBannersLoadingState extends SlashStates {}
class SlashGetBannersDoneState extends SlashStates {}
class SlashGetBannersErrorState extends SlashStates {
  final error;
  SlashGetBannersErrorState(this.error);
}

class SlashGetCategoriesLoadingState extends SlashStates {}
class SlashGetCategoriesDoneState extends SlashStates {}
class SlashGetCategoriesErrorState extends SlashStates {
  final error;
  SlashGetCategoriesErrorState(this.error);
}


class SlashGetProductsLoadingState extends SlashStates {}
class SlashGetProductsDoneState extends SlashStates {}
class SlashGetProductsErrorState extends SlashStates {
  final error;
  SlashGetProductsErrorState(this.error);
}