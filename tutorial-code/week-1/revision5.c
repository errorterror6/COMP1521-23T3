    struct node *a = NULL:
    struct node *b = malloc(sizeof *b);
    struct node *c = malloc(sizeof(struct node));
    struct node *d = malloc(8);
    c = a;
    d->data = 42;
    c->data = 42; //actually a->data