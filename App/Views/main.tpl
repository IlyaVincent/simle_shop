<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">Simple shop</h1>
            <a href="/cart" class="btn btn-primary my-2"><i class="fas fa-shopping-cart"></i> Корзина</a>
            <a href="/orders" class="btn btn-primary my-2"><i class="fas fa-clipboard-list"></i> Список заказов</a>
            </p>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row justify-content-center">
                <div class="btn-group btn-group" role="group">
                    <?php for ($item = 0; $item < count($this->categories); $item ++): ?>
                    <button type="button" class="nav-link btn btn-light"> <?=$this->categories[$item]->name?></button>
                    <? endfor; ?>
                    <button type="button" class="reset btn btn-light"> Показать все</button>
                </div>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row">

                <?php foreach ($this->products as $product): ?>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm category-<?=$product->categoryId?>">
                        <img src="<?=$product->href?>" height="225">
                        <div class="card-body">
                            <small class="card-category"> <?=$this->categories[$product->categoryId - 1]->name?></small>
                            <p class="card-text"> <?=$product->name?> </p>
                            <p class="card-text"> <?=$product->description?> </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="/id<?=$product->id;?>" role="button"
                                       class="btn btn-sm btn-outline-secondary">
                                        Подробнее
                                    </a>

                                </div>
                                <!--<small class="text-muted"><?=$product->stock?> шт.</small>-->
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>

            </div>
        </div>
    </div>

</main>
