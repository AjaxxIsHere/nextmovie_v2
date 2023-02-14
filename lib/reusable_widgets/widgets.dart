import 'package:flutter/material.dart';
import 'package:nextmovie_v2/utilities/text_styles.dart';

// Logo for sign in page
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 200,
    height: 200,
  );
}

// Text field for inputting data like username or password
TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

// Sign in button
Container signInsignUpButtons(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 40,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? "LOG IN" : "SIGN UP",
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}

/*ElevatedButton LogoutButton() {
  return ElevatedButton(
      onPressed: () {
        FirebaseAuth.instance.signOut().then((value) {
          print("Signed Out");
          Navigator.pushReplacement(context as BuildContext,
              MaterialPageRoute(builder: (context) => const signinScreen()));
        });
      },
      child: const Text("Logout"));
}*/

class TrendingMoviesContainer extends StatelessWidget {
  final List trending;

  const TrendingMoviesContainer({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const textModified(
              text: "Trending 🔥", color: Colors.white, size: 26),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']))),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        child: textModified(
                          text: trending[index]['title'] ?? 'Loading',
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MostPopularMoviesContainer extends StatelessWidget {
  final List MostPopular;

  const MostPopularMoviesContainer({super.key, required this.MostPopular});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const textModified(
              text: "Most Popular 🎥", color: Colors.white, size: 26),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MostPopular.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        MostPopular[index]['poster_path']))),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        child: textModified(
                          text: MostPopular[index]['title'] ?? 'Loading',
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TvShowsContainer extends StatelessWidget {
  final List TvShows;

  const TvShowsContainer({super.key, required this.TvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const textModified(
              text: "Popular Tv Shows 📺", color: Colors.white, size: 26),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: TvShows.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        TvShows[index]['poster_path']))),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        child: textModified(
                          text: TvShows[index]['title'] ?? 'Loading',
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
