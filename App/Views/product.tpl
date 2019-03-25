<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Описание товара</h1>
            <a href="/" class="btn btn-primary my-2"><i class="fas fa-long-arrow-alt-left"></i> Вернуться в магазин</a>
            <a href="/cart" class="btn btn-primary my-2"><i class="fas fa-shopping-cart"></i> Корзина</a>
            <a href="/orders" class="btn btn-primary my-2"><i class="fas fa-clipboard-list"></i> Список заказов</a>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="media">
                <img src="<?=$this->product[0]->href?>" class="mr-3">
                <div class="media-body">
                    <h5 class="mt-0"><?=$this->product[0]->name?></h5>
                    <p class="py-1"><?=$this->product[0]->description?></p>
                    <p class="py-1">Количестов на складе: <span id="amount"><?=$this->product[0]->stock?></span></p>
                    <form id="add-to-cart">
                    <div class="input-group mb-3">
                        <input style="display: none;" name="id" value="<?=$this->product[0]->id?>">
                        <input id="total" name="amount" type="number" value="1" min="1" max="<?=$this->product[0]->stock?>" class="form-control" placeholder="Укажите количество">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit" id="add-cart">Добавить в Корзину</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>
