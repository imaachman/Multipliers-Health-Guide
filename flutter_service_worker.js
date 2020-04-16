'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b49964b5aceeac93cc9de3f2ab8f6325",
"assets/assets/Alatsi-Regular.ttf": "22c595c04db22bb0363d711f5c1cd486",
"assets/assets/docs/9E5%2520HEALTH%2520DRINK%2520ENGLISH.md": "79f0a2f03460cf751c3a6e0466d2f9f4",
"assets/assets/docs/9E5%2520HEALTH%2520DRINK%2520HINDI.md": "919af9cbf24152d1e88e6c669eeb5d18",
"assets/assets/docs/ANTILERGY%2520ENGLISH.md": "e1d01d85612b46abd0d8276868a07cdc",
"assets/assets/docs/ANTILERGY%2520HINDI.md": "255936bc9765a1fa10e2462cf8d9ae49",
"assets/assets/docs/AYUSHWAAS%2520ENGLISH.md": "60ec537318c322bdc5f22425f658ceb5",
"assets/assets/docs/AYUSHWAAS%2520HINDI.md": "99e2a04b3c7dead9cc309f7e757d7ba5",
"assets/assets/docs/BELOW%252037%2520ENGLISH.md": "162e9dcf535a550201253392a4a3dc38",
"assets/assets/docs/BELOW%252037%2520HINDI.md": "192fb1a93b8335eae494144a7f3b196d",
"assets/assets/docs/BLOOD%2520PURIFIER%2520ENGLISH.md": "f449d670834af3df2c66ddd2d027b340",
"assets/assets/docs/BLOOD%2520PURIFIER%2520HINDI.md": "3610d8b87a27f4269d9dd8a406b93eaa",
"assets/assets/docs/COF%2520NIL%2520ENGLISH.md": "455966cfa022d0ac37925984cb24f710",
"assets/assets/docs/COF%2520NIL%2520HINDI.md": "d73e36ca8c1b9c94980d46f1e711715f",
"assets/assets/docs/CYCLOVA%2520ENGLISH.md": "1cbc3716e906d7d58db639a03f324e44",
"assets/assets/docs/CYCLOVA%2520HINDI.md": "38b2d1bbd5093d02f669cb399a7501a1",
"assets/assets/docs/DAILY%2520DETOX%2520ENGLISH.md": "82aad2f98e7c4858ea4290ec053a2837",
"assets/assets/docs/DAILY%2520DETOX%2520HINDI.md": "7f661d342db357b94b64a5957edd6430",
"assets/assets/docs/DIABA%2520LIFE%2520ENGLISH.md": "847e7a750293fdc72994c81a51c3bb27",
"assets/assets/docs/DIABA%2520LIFE%2520HINDI.md": "34bd508d7a1ce94d31e8cb960f0ee761",
"assets/assets/docs/FEALING%2520SYRUP%2520ENGLISH.md": "1523081eca1cc8c54a64cbf6dab8c90e",
"assets/assets/docs/FEALING%2520SYRUP%2520HINDI.md": "a58159008f6a8015098ff21c8bb2b70a",
"assets/assets/docs/IMMUNO%25203%2520CAP%2520ENGLISH.md": "c43fa9edc6ff98e4135cbe076e5abae5",
"assets/assets/docs/IMMUNO%25203%2520CAP%2520HINDI.md": "f62a652603f0c2e03019aae65c5dd714",
"assets/assets/docs/KAVACH%2520PRASH%2520ENGLISH.md": "7ff7aa5cc2c1e88c905b05e99e4d7aeb",
"assets/assets/docs/KAVACH%2520PRASH%2520HINDI.md": "fa59c3d2008e3d69b9d2116ed7b2adf8",
"assets/assets/docs/LIV%2520a'GAIN%2520CAP%2520ENGLISH.md": "9378656bf5f3af3e1b42a65cea9670a0",
"assets/assets/docs/LIV%2520a'GAIN%2520CAP%2520HINDI.md": "1cf73845c35b1f56b97aedafec3b8344",
"assets/assets/docs/LIV%2520a'GAIN%2520SYRUP%2520ENGLISH.md": "80210b7a6d490034c56874ca135cd63a",
"assets/assets/docs/LIV%2520a'GAIN%2520SYRUP%2520HINDI.md": "95f575e6f308b3a1008d629eedf4bbeb",
"assets/assets/docs/MAHA%2520BHRINGRAJ%2520OIL%2520ENGLISH.md": "8e7ab1c27dc0c5b5f58b560040e951d4",
"assets/assets/docs/MAHA%2520BHRINGRAJ%2520OIL%2520HINDI.md": "03c544356d0b9fdb14eac2ddaac0016d",
"assets/assets/docs/MAN%2520SHAKTIMAN%2520ENGLISH.md": "fac66df8b35fb44f664d7ad4bab5093e",
"assets/assets/docs/MAN%2520SHAKTIMAN%2520HINDI.md": "a716f16695f6980944d49da54efcea81",
"assets/assets/docs/MELT%2520FAT%2520ENGLISH.md": "96949924b288fc113d9b111053370993",
"assets/assets/docs/MELT%2520FAT%2520HINDI.md": "6c54e999bb7f6e6dd0206dff19e60a79",
"assets/assets/docs/NATCIUM%2520ENGLISH.md": "423a87ebf179a5c13a06bb4acc74d795",
"assets/assets/docs/NATCIUM%2520HINDI.md": "67bff698830fbf489cffcfcdc9264761",
"assets/assets/docs/NO%2520VEDNA%2520CAP%2520ENGLISH.md": "b91ee84d7a7de21ae2404611e9492e1b",
"assets/assets/docs/NO%2520VEDNA%2520CAP%2520HINDI.md": "75900a3cda20979b137b4f0bb2399b87",
"assets/assets/docs/NO%2520VEDNA%2520GEL%2520ENGLISH.md": "15e56035f4b71bf6fff358b2c6f1c1f0",
"assets/assets/docs/NO%2520VEDNA%2520GEL%2520HINDI.md": "080b0e7f83e76ae7cf3a960026593550",
"assets/assets/docs/NUTRILIFE%2520ENGLISH.md": "2d622b21988123ee4f348b562e37920c",
"assets/assets/docs/NUTRILIFE%2520HINDI.md": "062b54929723af2207e71e83e24b2cba",
"assets/assets/docs/PHYT%2520STRESS%2520ENGLISH.md": "af7d8d6ff912dd631f4630c4e90e0e8f",
"assets/assets/docs/PHYT%2520STRESS%2520HINDI.md": "68c3dc1899b8badb4e712bc6017fef7c",
"assets/assets/docs/PROTEIN%2520POWDER%2520ENGLISH.md": "6f57285045059ac64dd15ae69764dfb6",
"assets/assets/docs/PROTEIN%2520POWDER%2520HINDI.md": "c1372a58e3727742fed016ae4de507e4",
"assets/assets/docs/SPIRULINA%2520GOLD%2520ENGLISH.md": "72ec139f89e59898f9e18a36e342f3e9",
"assets/assets/docs/SPIRULINA%2520GOLD%2520HINDI.md": "cbfeb47edc40a0b39c1d04544fad9090",
"assets/assets/docs/ThyHealth%2520ENGLISH.md": "002fb41e223542e28cbd598118f136d8",
"assets/assets/docs/ThyHealth%2520HINDI.md": "75f808d13ce0283cfe5b1b82abb28a4e",
"assets/assets/docs/URI%2520FLUSH-3%2520ENGLISH.md": "2c1484b636e651440a183b47ce1f85b7",
"assets/assets/docs/URI%2520FLUSH-3%2520HINDI.md": "e56319501e8a977105165fba3acbbfdc",
"assets/assets/docs/WELL%2520HART%2520ENGLISH.md": "d131fb67cfff8ae4afa865ad672e571c",
"assets/assets/docs/WELL%2520HART%2520HINDI.md": "11b1fb60183a211154d82c34e0ac22dc",
"assets/assets/docs/WOMAN%2520COMPANION%2520ENGLISH.md": "611488c9d397038ad23768835773ae53",
"assets/assets/docs/WOMAN%2520COMPANION%2520HINDI.md": "1f50d502ad8736a36cb9466d00ba02df",
"assets/assets/docs/WOUND%2520HEALING%2520CRM%2520ENGLISH.md": "70303214647243f3a36ac101abbb64f8",
"assets/assets/docs/WOUND%2520HEALING%2520CRM%2520HINDI.md": "a9720e07bbdcee043f0912a30daaee88",
"assets/assets/images/9E5%2520HEALTH%2520DRINK.png": "96bb8453d906bd76ae72b4c79004b72d",
"assets/assets/images/ANTILERGY.png": "e6f256f38418903d7cef15d5db670f54",
"assets/assets/images/AYUSHWAAS.png": "d4e1af574307c3b75c293e3112f03634",
"assets/assets/images/BELOW%252037.png": "8ab700687946faf23990bf9646a5f793",
"assets/assets/images/BLOOD%2520PURIFIER.png": "87bbc7dd821075168ec208f557d6ebca",
"assets/assets/images/COF%2520NIL.png": "b6f53d949fcd5801c824f6cf65591f10",
"assets/assets/images/CYCLOVA.png": "b465fd846a5846f80ebd021c1da720bd",
"assets/assets/images/DAILY%2520DETOX.png": "700776b9ad4f506bd77b16b49707ccbd",
"assets/assets/images/DIABA%2520LIFE.png": "e398652c3a1561238ef44604631b9dab",
"assets/assets/images/En.png": "74025d27ba8b88d139250e470147f15b",
"assets/assets/images/FEALING%2520SYRUP.png": "53e7a763d985922fece07e86ed3f7b99",
"assets/assets/images/Hi.png": "fd6d39d55303d62bf3cde348a093d4d9",
"assets/assets/images/IMMUNO%25203%2520CAP.png": "4a824a9bc6319e33ef807fc45cff93c0",
"assets/assets/images/KAVACH%2520PRASH.png": "5f3f05a8f9cf47ddee6f12bf464b5364",
"assets/assets/images/LIV%2520a'GAIN%2520CAP.png": "1cf39c00cfeb9759a740bcda47ce7f6b",
"assets/assets/images/LIV%2520a'GAIN%2520SYRUP.png": "c09e4c9eb310e4b5e3cde8495bb47ba8",
"assets/assets/images/logo.png": "80172081ce11ce53d7842c6816e51f10",
"assets/assets/images/MAHA%2520BHRINGRAJ%2520OIL.png": "a5337c2064099793af917fb4044c6f17",
"assets/assets/images/MAN%2520SHAKTIMAN.png": "c0791a271366812641867aedb5525ba5",
"assets/assets/images/MELT%2520FAT.png": "b0cc31afc25bddf130a6c1d31a7fd91d",
"assets/assets/images/NATCIUM.png": "52c3c406db976fd595d927f892c27522",
"assets/assets/images/NO%2520VEDNA%2520CAP.png": "bd251e4691f7d6983d5b767343252603",
"assets/assets/images/NO%2520VEDNA%2520GEL.png": "7dc8a4e28ab6352dc9fc684dc3b7f585",
"assets/assets/images/NUTRILIFE.png": "b55fb93a3c6caadfaa5e6f24434608ad",
"assets/assets/images/PHYT%2520STRESS.png": "a55a71d544f07ee50055e6ace31003d6",
"assets/assets/images/PROTEIN%2520POWDER.png": "2faaaf6019403a1a88c948d18cce50ad",
"assets/assets/images/SPIRULINA%2520GOLD.png": "936e79f72c999e3a6415af9e51bfaccf",
"assets/assets/images/ThyHealth.png": "331ab4369124645a08417485e1b25df6",
"assets/assets/images/URI%2520FLUSH-3.png": "c86701df00451bdbeabac1e29c8c6eaf",
"assets/assets/images/WELL%2520HART.png": "9f5642c8e3bbf265c31ad1c59b247447",
"assets/assets/images/WOMAN%2520COMPANION.png": "c9d7162716b58fceaf43ab2adc47981e",
"assets/assets/images/WOUND%2520HEALING%2520CRM.png": "e0798f5d928dfa849aa60de5ccea0f19",
"assets/assets/Pacifico-Regular.ttf": "9b94499ccea3bd82b24cb210733c4b5e",
"assets/assets/Roboto-Light.ttf": "88823c2015ffd5fa89d567e17297a137",
"assets/FontManifest.json": "4cff91f28c8bf332bfd80881caed95bb",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "aaaef2b6fd1fb14271cff4f0293e8183",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/flutter_markdown/assets/logo.png": "67642a0b80f3d50277c44cde8f450e50",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/products_app_xx.png": "e9cf34da67d0d06b1201dcdda226db0d",
"icons/products_app_xxx.png": "908a0adee1a2218dbc6f8921d0522a66",
"index.html": "0158a19482c1232de4f5bb55750c34ff",
"/": "0158a19482c1232de4f5bb55750c34ff",
"main.dart.js": "3a2cb823bb732de2d7bee301251d2754",
"manifest.json": "ce9c6bd69cac1b9117d1f84989b8e859",
"products_app_fav.png": "31634cc5d722be77515d84de81972fbe"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
