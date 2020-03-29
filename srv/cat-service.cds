using my.bookshop as my from '../db/data-model';

service CatalogService {
    //@readonly 
    entity Books @Insertable as projection on my.Books;
    entity Authors @Insertable as projection on my.Authors;
    //annotate Books with @odata.draft.enabled;
}