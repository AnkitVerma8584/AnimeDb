import 'package:cafeburp/models/anime.dart';
import 'package:cafeburp/models/anime_meta.dart';
import 'package:cafeburp/data/remote/constants.dart';
import 'package:cafeburp/models/genre.dart';

class AnimeList {
  final List<Anime> animes;
  final Meta meta;

  AnimeList({required this.animes, required this.meta});
}

class Dummy {
  static List<Genre> getGenreList() {
    return [
      const Genre(id: "Action", name: "Action"),
      const Genre(id: "Sci-fi", name: "Sci-fi"),
      const Genre(id: "Suspense", name: "Suspense"),
    ];
  }

  static AnimeList getAnimeList() {
    return AnimeList(animes: [
      Anime(
          id: "id1",
          title: "Naruto",
          alternativeTitles: [
            "Shippuden is onasi nono inoi non on oinoainfon oin oino inoianfoin aoinfinw aoinfoinoin ion ion oinfonwaoin foinn",
            "Good nias noiasn ",
          ],
          ranking: 1,
          genres: ["shonen", "action"],
          episodes: 700,
          hasEpisode: true,
          hasRanking: true,
          image:
              "https://m.media-amazon.com/images/M/MV5BZGFiMWFhNDAtMzUyZS00NmQ2LTljNDYtMmZjNTc5MDUxMzViXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg",
          link: "link",
          status: "status",
          synopsis: synopsis,
          thumb: "thumb",
          type: "type"),
      Anime(
          id: "id2",
          title: "Boruto : Naruto next generations",
          alternativeTitles: ["Next gen"],
          ranking: 1,
          genres: ["shonen", "action"],
          episodes: 200,
          hasEpisode: true,
          hasRanking: true,
          image:
              "https://th.bing.com/th/id/R.6a0bef679ee619e44a338ab38deeea44?rik=WpGKv8hTbGnJkg&riu=http%3a%2f%2fstatic.zerochan.net%2fUzumaki.Boruto.full.1797176.jpg&ehk=nvxTjctvvnhkwvYjlJ0gHpdW9OoWq8swxlWpxxqqoV4%3d&risl=&pid=ImgRaw&r=0",
          link: "link",
          status: "status",
          synopsis:
              "synopsis Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vel orci porta non pulvinar neque laoreet. Nunc aliquet bibendum enim facilisis. Et pharetra pharetra massa massa ultricies. Ac tincidunt vitae semper quis lectus nulla at. Vitae justo eget magna fermentum iaculis. Nullam non nisi est sit amet. Nullam eget felis eget nunc lobortis mattis aliquam. A diam maecenas sed enim. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Lectus mauris ultrices eros in cursus. Dictumst quisque sagittis purus sit amet volutpat consequat. Et netus et malesuada fames ac turpis egestas Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vel orci porta non pulvinar neque laoreet. Nunc aliquet bibendum enim facilisis. Et pharetra pharetra massa massa ultricies. Ac tincidunt vitae semper quis lectus nulla at. Vitae justo eget magna fermentum iaculis. Nullam non nisi est sit amet. Nullam eget felis eget nunc lobortis mattis aliquam. A diam maecenas sed enim. Volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris. Lectus mauris ultrices eros in cursus. Dictumst quisque sagittis purus sit amet volutpat consequat. Et netus et malesuada fames ac turpis egestas",
          thumb: "thumb",
          type: "type")
    ], meta: Meta(page: 1, size: 1, totalData: 1, totalPage: 1));
  }
}
