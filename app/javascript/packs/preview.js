if(location.pathname.match("posts/new")|| location.pathname.match("posts/edit")){
  document.addEventListener("DOMContentLoaded", function(){
    const ImgPrev = document.getElementById('img-prev');

    document.getElementById('posts_member_image').addEventListener('change', function(e){
      //画像データを取得
      const file = e.target.files[0];
      // 画像データから画像URLを作成
      const blob = window.URL.createObjectURL(file);

      //画像表示のためのdiv生成
      const imageElement = document.createElement('div');

      // img要素生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'w-100');
      
      // 親要素に子要素を追加
      imageElement.appendChild(blobImage);
      ImgPrev.appendChild(imageElement);
    });
  });
};