@extends ('layouts.app')

@section('content')

<div class="container-fluid">

    <?php if(isset($error)): ?>
        <div class="alert alert-danger" role="alert">
            <?=$error?>
        </div>
    <?php endif; ?>

    <h1 class="h1 text-center">Waifu Pics!</h1>

    <div class="container center_div">
        <form action="{{ route('getWaifu')}}">
            <div class="form-row align-items-center justify-content-center">
                <div class="col-sm-3 my-1">
                    <label class="sr-only" for="category">Category</label>
                    <select class="form-control" name="category" id="category">
                        <!-- Naturally these would probably be stored in a database but due to time constaints... -->
                        <!--Category::pluck('category', 'id'); -->
                        <!--This could also probably be handled in a better way but right now it escapes me.-->
                        <option value="waifu" <?php if(isset($category) && $category == 'waifu') {echo 'selected';} ?>>Waifu</option>
                        <option value="neko" <?php if(isset($category) && $category == 'neko') {echo 'selected';} ?>>Neko</option>
                        <option value="bully" <?php if(isset($category) && $category == 'bully') {echo 'selected';} ?>>Bully</option>
                        <option value="wave" <?php if(isset($category) && $category == 'wave') {echo 'selected';} ?>>Wave</option>
                    </select>
                </div>

                <div class="col-sm-3 my-1">
                    <label class="sr-only" for="suitabilityForWork">Username</label>
                    <select class="form-control" name="suitabilityForWork" id="suitabilityForWork">
                        <option value="sfw" selected>Safe for Work (SFW)</option>

                        <!--I'll save you from testing this one -->
                        <option value="nsfw" disabled>Not Safe for Work (NSFW)</option>
                    </select>
                </div>

                <div class="col-auto my-1">
                    <button class="btn, btn-primary">Get Waifu!</button>
                </div>
            </div>
        </form>
    </div>

    <br>

    <?php if(isset($waifu['url'])): ?>
        <div class="fixedSizeImageContainer container-sm">
            <img src=<?=$waifu['url']?> alt="Your favourite waifu" class="img-fluid">
        </div>
        <?php else: ?>
        <div class="fixedSizeImageContainer container-sm">
            <img src='https://i.pinimg.com/originals/04/9d/c3/049dc3a86e12ee299b82ebc4fba97d2a.jpg' alt="Waifu Placeholder" class="img-fluid">
        </div>
    <?php endif; ?>
</div>
@stop