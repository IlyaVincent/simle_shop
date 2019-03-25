<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Корзина</h1>
                <a href="/" class="btn btn-primary my-2"><i class="fas fa-long-arrow-alt-left"></i>  Вернуться в магазин</a>
                <a href="/orders" class="btn btn-primary my-2"><i class="fas fa-clipboard-list"></i>  Список заказов</a>
        </div>
    </section>
<section>
    <div class="container">
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
                <td><?=$this->categories[$this->products[$productCart->productId - 1]->categoryId -1]->name?></td>
                <td><?=$productCart->amount?></td>
            </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        <div class="py-5">
            <a href="/order" type="button" class="btn btn-primary btn-lg btn-block">Оформить заказ</a>
        </div>
    </div>
</section>

</main>
