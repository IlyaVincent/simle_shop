<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Список заказов</h1>
            <a href="/" class="btn btn-primary my-2"><i class="fas fa-long-arrow-alt-left"></i> Вернуться в магазин</a>
            <a href="/cart" class="btn btn-primary my-2"><i class="fas fa-shopping-cart"></i> Корзина</a>
        </div>
    </section>
    <section>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">Имя</th>
                    <th scope="col">Телефон</th>
                    <th scope="col">Заказ</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($this->orders as $order): ?>
                <tr>
                    <td><?=$order->name?></td>
                    <td><?=$order->tel?></td>
                    <td>
                        <table class="table table-sm table-striped">
                            <tr>
                                <td scope="col">Название товара</td>
                                <td scope="col">Категория</td>
                                <td scope="col">Количество</td>
                            </tr>
                            <?php foreach ($order->cart as $item): ?>
                            <tr>
                                <td scope="col"><?=$this->products[$item->productId - 1]->name?></td>
                                <td scope="col"><?=$this->
                                    categories[$this->products[$item->productId-1]->categoryId-1]->name?>
                                </td>
                                <td scope="col"><?=$item->amount?></td>
                            </tr>
                            <?php endforeach; ?>
                        </table>
                    </td>
                </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </section>

</main>