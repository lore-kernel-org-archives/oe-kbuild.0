Content-Type: multipart/mixed; boundary="===============5904635868796449553=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: samples/landlock/sandboxer.c:139:1: warning: leak of 'path_list' [CWE-401]
Date: Mon, 04 Apr 2022 20:22:37 +0800
Message-ID: <202204042037.pY2LaXl6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5904635868796449553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Micka=C3=ABl Sala=C3=BCn" <mic@linux.microsoft.com>
CC: James Morris <jamorris@linux.microsoft.com>
CC: Jann Horn <jannh@google.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: ba84b0bf5a164f0f523656c1e37568c30f3f3303 samples/landlock: Add a sa=
ndbox manager example
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001-20220404 (https://download.01.org/0day-ci/arch=
ive/20220404/202204042037.pY2LaXl6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dba84b0bf5a164f0f523656c1e37568c30f3f3303
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ba84b0bf5a164f0f523656c1e37568c30f3f3303
        # save the config file to linux build tree
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   samples/landlock/sandboxer.c: In function 'populate_ruleset':
>> samples/landlock/sandboxer.c:139:1: warning: leak of 'path_list' [CWE-40=
1] [-Wanalyzer-malloc-leak]
     139 | }
         | ^
     'main': events 1-6
       |
       |  158 | int main(const int argc, char *const argv[], char *const *c=
onst envp)
       |      |     ^~~~
       |      |     |
       |      |     (1) entry to 'main'
       |......
       |  168 |         if (argc < 2) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'argc > 1')...
       |......
       |  186 |         ruleset_fd =3D landlock_create_ruleset(&ruleset_att=
r, sizeof(ruleset_attr), 0);
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (3) ...to here
       |  187 |         if (ruleset_fd < 0) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'ruleset_fd >=
=3D 0')...
       |......
       |  208 |         if (populate_ruleset(ENV_FS_RO_NAME, ruleset_fd,
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (5) ...to here
       |      |             (6) calling 'populate_ruleset' from 'main'
       |  209 |                                 ACCESS_FS_ROUGHLY_READ)) {
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'populate_ruleset': events 7-10
              |
              |   78 | static int populate_ruleset(
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'populate_ruleset'
              |......
              |   90 |         if (!env_path_name) {
              |      |            ~
              |      |            |
              |      |            (8) following 'false' branch (when 'env_p=
ath_name' is non-NULL)...
              |......
              |   95 |         env_path_name =3D strdup(env_path_name);
              |      |                         ~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (9) ...to here
              |   96 |         unsetenv(env_var);
              |   97 |         num_paths =3D parse_path(env_path_name, &pat=
h_list);
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                     |
              |      |                     (10) calling 'parse_path' from '=
populate_ruleset'
              |
              +--> 'parse_path': events 11-14
                     |
                     |   55 | static int parse_path(char *env_path, const c=
har ***const path_list)
                     |      |            ^~~~~~~~~~
                     |      |            |
                     |      |            (11) entry to 'parse_path'
                     |......
                     |   59 |         if (env_path) {
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'true' branch...
                     |   60 |                 num_paths++;
                     |      |                 ~~~~~~~~~~~
                     |      |                          |
                     |      |                          (13) ...to here
                     |......
                     |   66 |         *path_list =3D malloc(num_paths * siz=
eof(**path_list));
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (14) allocated here
                     |
              <------+
              |
            'populate_ruleset': events 15-19
              |
              |   97 |         num_paths =3D parse_path(env_path_name, &pat=
h_list);
              |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                     |
              |      |                     (15) returning to 'populate_rule=
set' from 'parse_path'
              |   98 |         if (num_paths =3D=3D 1 && path_list[0][0] =
=3D=3D '\0') {
              |      |            ~                  ~~~~~~~~~~~~
              |      |            |                           |
              |      |            |                           (17) ...to he=
re
              |      |            |                           (18) assuming=
 'path_list' is non-NULL
              |      |            (16) following 'true' branch (when 'num_p=
aths =3D=3D 1')...
              |......
              |  139 | }
              |      | ~                    =

              |      | |
              |      | (19) 'path_list' leaks here; was allocated@(14)
              |
>> samples/landlock/sandboxer.c:139:1: warning: leak of 'path_list' [CWE-40=
1] [-Wanalyzer-malloc-leak]
     139 | }
         | ^
     'main': events 1-6
       |
       |  158 | int main(const int argc, char *const argv[], char *const *c=
onst envp)
       |      |     ^~~~
       |      |     |
       |      |     (1) entry to 'main'
       |......
       |  168 |         if (argc < 2) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'argc > 1')...
       |......
       |  186 |         ruleset_fd =3D landlock_create_ruleset(&ruleset_att=
r, sizeof(ruleset_attr), 0);
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (3) ...to here
       |  187 |         if (ruleset_fd < 0) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'ruleset_fd >=
=3D 0')...
       |......
       |  208 |         if (populate_ruleset(ENV_FS_RO_NAME, ruleset_fd,
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (5) ...to here
       |      |             (6) calling 'populate_ruleset' from 'main'
       |  209 |                                 ACCESS_FS_ROUGHLY_READ)) {
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'populate_ruleset': events 7-10
              |
              |   78 | static int populate_ruleset(
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'populate_ruleset'
              |......
              |   90 |         if (!env_path_name) {
              |      |            ~
              |      |            |
              |      |            (8) following 'false' branch (when 'env_p=
ath_name' is non-NULL)...
              |......
              |   95 |         env_path_name =3D strdup(env_path_name);
              |      |                         ~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (9) ...to here
              |   96 |         unsetenv(env_var);
              |   97 |         num_paths =3D parse_path(env_path_name, &pat=
h_list);
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                     |
              |      |                     (10) calling 'parse_path' from '=
populate_ruleset'
              |
              +--> 'parse_path': events 11-16
                     |
                     |   55 | static int parse_path(char *env_path, const c=
har ***const path_list)
                     |      |            ^~~~~~~~~~
                     |      |            |
                     |      |            (11) entry to 'parse_path'
                     |......
                     |   59 |         if (env_path) {
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'false' branch...
                     |......
                     |   66 |         *path_list =3D malloc(num_paths * siz=
eof(**path_list));
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (13) ...to here
                     |      |                      (14) allocated here
                     |   67 |         for (i =3D 0; i < num_paths; i++)
                     |      |                     ~~~~~~~~~~~~~
                     |      |                       |
                     |      |                       (15) following 'false' =
branch (when 'i >=3D num_paths')...
                     |......
                     |   70 |         return num_paths;
                     |      |                ~~~~~~~~~
                     |      |                |
                     |      |                (16) ...to here
                     |
              <------+
              |
            'populate_ruleset': events 17-22
              |
              |   97 |         num_paths =3D parse_path(env_path_name, &pat=
h_list);
              |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                     |
              |      |                     (17) returning to 'populate_rule=
set' from 'parse_path'
              |   98 |         if (num_paths =3D=3D 1 && path_list[0][0] =
=3D=3D '\0') {
              |      |            ~         =

              |      |            |
              |      |            (18) following 'false' branch (when 'num_=
paths !=3D 1')...
              |......
              |  107 |         for (i =3D 0; i < num_paths; i++) {
              |      |              ~~~~~  ~~~~~~~~~~~~~
              |      |                |      |
              |      |                |      (20) following 'false' branch =
(when 'i >=3D num_paths')...
              |      |                (19) ...to here
              |......
              |  134 |         ret =3D 0;
              |      |         ~~~~~~~      =

              |      |             |
              |      |             (21) ...to here
              |......
              |  139 | }
              |      | ~                    =

              |      | |
              |      | (22) 'path_list' leaks here; was allocated at (14)
              |
>> samples/landlock/sandboxer.c:98:40: warning: dereference of possibly-NUL=
L 'path_list' [CWE-690] [-Wanalyzer-possible-null-dereference]
      98 |         if (num_paths =3D=3D 1 && path_list[0][0] =3D=3D '\0') {
         |                               ~~~~~~~~~^~~
     'populate_ruleset': events 1-4
       |
       |   78 | static int populate_ruleset(
       |      |            ^~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'populate_ruleset'
       |......
       |   90 |         if (!env_path_name) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'env_path_nam=
e' is non-NULL)...
       |......
       |   95 |         env_path_name =3D strdup(env_path_name);
       |      |                         ~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (3) ...to here
       |   96 |         unsetenv(env_var);
       |   97 |         num_paths =3D parse_path(env_path_name, &path_list);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (4) calling 'parse_path' from 'populate=
_ruleset'
       |
       +--> 'parse_path': events 5-8
              |
              |   55 | static int parse_path(char *env_path, const char ***=
const path_list)
              |      |            ^~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'parse_path'
              |......
              |   59 |         if (env_path) {
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch...
              |   60 |                 num_paths++;
              |      |                 ~~~~~~~~~~~
              |      |                          |
              |      |                          (7) ...to here
              |......
              |   66 |         *path_list =3D malloc(num_paths * sizeof(**p=
ath_list));
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
              |      |                      |
              |      |                      (8) this call could return NULL
              |
       <------+
       |
     'populate_ruleset': events 9-12
       |
       |   97 |         num_paths =3D parse_path(env_path_name, &path_list);
       |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (9) returning to 'populate_ruleset' fro=
m 'parse_path'
       |   98 |         if (num_paths =3D=3D 1 && path_list[0][0] =3D=3D '\=
0') {
       |      |            ~                  ~~~~~~~~~~~~
       |      |            |                           |
       |      |            |                           (11) ...to here
       |      |            |                           (12) 'path_list' cou=
ld be NULL: unchecked value from (8)
       |      |            (10) following 'true' branch (when 'num_paths =
=3D=3D 1')...
       |

vim +/path_list +139 samples/landlock/sandboxer.c

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   72  =

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   73  #define ACCESS_FIL=
E ( \
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   74  	LANDLOCK_ACCESS_F=
S_EXECUTE | \
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   75  	LANDLOCK_ACCESS_F=
S_WRITE_FILE | \
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   76  	LANDLOCK_ACCESS_F=
S_READ_FILE)
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   77  =

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   78  static int populat=
e_ruleset(
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   79  		const char *cons=
t env_var, const int ruleset_fd,
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   80  		const __u64 allo=
wed_access)
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   81  {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   82  	int num_paths, i,=
 ret =3D 1;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   83  	char *env_path_na=
me;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   84  	const char **path=
_list =3D NULL;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   85  	struct landlock_p=
ath_beneath_attr path_beneath =3D {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   86  		.parent_fd =3D -=
1,
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   87  	};
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   88  =

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   89  	env_path_name =3D=
 getenv(env_var);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   90  	if (!env_path_nam=
e) {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   91  		/* Prevents user=
s to forget a setting. */
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   92  		fprintf(stderr, =
"Missing environment variable %s\n", env_var);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   93  		return 1;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   94  	}
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   95  	env_path_name =3D=
 strdup(env_path_name);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   96  	unsetenv(env_var);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   97  	num_paths =3D par=
se_path(env_path_name, &path_list);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  @98  	if (num_paths =3D=
=3D 1 && path_list[0][0] =3D=3D '\0') {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22   99  		/*
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  100  		 * Allows to not=
 use all possible restrictions (e.g. use
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  101  		 * LL_FS_RO with=
out LL_FS_RW).
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  102  		 */
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  103  		ret =3D 0;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  104  		goto out_free_na=
me;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  105  	}
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  106  =

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  107  	for (i =3D 0; i <=
 num_paths; i++) {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  108  		struct stat stat=
buf;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  109  =

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  110  		path_beneath.par=
ent_fd =3D open(path_list[i], O_PATH |
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  111  				O_CLOEXEC);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  112  		if (path_beneath=
.parent_fd < 0) {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  113  			fprintf(stderr,=
 "Failed to open \"%s\": %s\n",
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  114  					path_list[i],
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  115  					strerror(errn=
o));
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  116  			goto out_free_n=
ame;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  117  		}
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  118  		if (fstat(path_b=
eneath.parent_fd, &statbuf)) {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  119  			close(path_bene=
ath.parent_fd);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  120  			goto out_free_n=
ame;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  121  		}
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  122  		path_beneath.all=
owed_access =3D allowed_access;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  123  		if (!S_ISDIR(sta=
tbuf.st_mode))
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  124  			path_beneath.al=
lowed_access &=3D ACCESS_FILE;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  125  		if (landlock_add=
_rule(ruleset_fd, LANDLOCK_RULE_PATH_BENEATH,
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  126  					&path_beneath=
, 0)) {
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  127  			fprintf(stderr,=
 "Failed to update the ruleset with \"%s\": %s\n",
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  128  					path_list[i],=
 strerror(errno));
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  129  			close(path_bene=
ath.parent_fd);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  130  			goto out_free_n=
ame;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  131  		}
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  132  		close(path_benea=
th.parent_fd);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  133  	}
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  134  	ret =3D 0;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  135  =

ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  136  out_free_name:
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  137  	free(env_path_nam=
e);
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  138  	return ret;
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22 @139  }
ba84b0bf5a164f Micka=C3=ABl Sala=C3=BCn 2021-04-22  140  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5904635868796449553==--

