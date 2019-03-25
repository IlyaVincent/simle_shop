<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Форма заказа</h1>
            <a href="/cart" class="btn btn-primary my-2"><i class="fas fa-shopping-cart"></i> Корзина</a>
            <a href="/orders" class="btn btn-primary my-2"><i class="fas fa-clipboard-list"></i> Список заказов</a>
            </p>
        </div>
    </section>
    <section>
        <div class="container">
            <form id="order-form">
                <div class="col-8 offset-2">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Имя</label>
                        <div class="col-sm-9">
                            <input type="text" name="username" class="form-control" id="name"
                                   placeholder="Имя">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Номер телефона</label>
                        <div class="col-sm-9">
                            <input name="tel" type="tel"
                                   class="form-control"
                                   id="phone" placeholder="Номер телефона">
                        </div>
                    </div>
                </div>
                <h3 class="text-center py-2">Ваш заказ</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">Название товара</th>
                        <th scope="col">Описание</th>
                        <th scope="col">Категория</th>
                        <th scope="col">Количество</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($this->productsCart as $productCart): ?>
                    <tr>
                        <th><?=$this->products[$productCart->productId - 1]->name?></th>
                        <td><?=$this->products[$productCart->productId - 1]->description?></td>
                        <td><?=$this->categories[$this->products[$productCart->productId - 1]->categoryId -1]->name?>
                        </td>
                        <td><?=$productCart->amount?></td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <button id="order" name="order" type="submit" class="btn btn-primary btn-lg btn-block">Подтвердить
                </button>
            </form>
        </div>
    </section>

</main>
