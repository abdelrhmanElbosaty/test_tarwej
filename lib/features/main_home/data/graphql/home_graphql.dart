const categoryQuery = r"""
query category {
  sections {
    code
    message
    success
    data {
      id
      arName
      enName
      thumbnail
      subCategories{
        id
        arName
        enName
        thumbnail
      }
    }
  }
}
""";

const featuredStoresQuery = r"""
query featuredStores($paginate: PaginatorInput) {
  stores(
    paginate: $paginate,
    filter: {
      isFeatured: true
    }
  ) {
    data {
      items {
        id
        image
        name
        city {
          id
          arName
          enName
        }
        rate
        bio
        isFollowed
        isOwner
        user {
          id
          userName
          profilePicture
        }
      }
      pageInfo {
        page
        limit
        hasNext
      }
    }
    code
    success
    message
  }
}
""";

const adsQuery = r"""
query advertisements($paginate:PaginatorInput, $filter:AdvertisementFilter){
  advertisements(paginate:$paginate, filter: $filter){
    code
    message
    data{
      pageInfo {
        limit
        page
        hasNext
      }
      items{
        id
        isFavorite
        title
        store{
          id
          image
          name
          rate
          isOwner
          isFollowed
          user {
            id
            userName
            profilePicture
          }
          createdAt
        }
        city{
          id
          arName
          enName
        }
        price
        offerPrice
        images
        description
        numberOfViews
        createdAt
      }
    }
  }
}
""";