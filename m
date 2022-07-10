Content-Type: multipart/mixed; boundary="===============3792670979000581636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:shuah/linux-kselftest/kunit 4/16] lib/kunit/executor.c:78 kunit_filter_tests() warn: possible memory leak of 'copy'
Date: Sun, 10 Jul 2022 13:56:56 +0800
Message-ID: <202207101328.ASjx88yj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3792670979000581636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Latypov <dlatypov@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: David Gow <davidgow@google.com>
CC: Brendan Higgins <brendanhiggins@google.com>

tree:   https://github.com/ammarfaizi2/linux-block shuah/linux-kselftest/ku=
nit
head:   7635778bac7e46458392c1261e3916e8e9e86860
commit: d2fbdde838f270377de4fc20e919aac3941ea55f [4/16] kunit: use kmemdup =
in kunit_filter_tests(), take suite as const
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-m031-20220707 (https://download.01.org/0day-ci/archi=
ve/20220710/202207101328.ASjx88yj-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
lib/kunit/executor.c:78 kunit_filter_tests() warn: possible memory leak of =
'copy'

vim +/copy +78 lib/kunit/executor.c

a127b154a8f2317 Daniel Latypov 2021-09-14  55  =

a127b154a8f2317 Daniel Latypov 2021-09-14  56  /* Create a copy of suite wi=
th only tests that match test_glob. */
a127b154a8f2317 Daniel Latypov 2021-09-14  57  static struct kunit_suite *
d2fbdde838f2703 Daniel Latypov 2022-05-16  58  kunit_filter_tests(const str=
uct kunit_suite *const suite, const char *test_glob)
a127b154a8f2317 Daniel Latypov 2021-09-14  59  {
a127b154a8f2317 Daniel Latypov 2021-09-14  60  	int n =3D 0;
a127b154a8f2317 Daniel Latypov 2021-09-14  61  	struct kunit_case *filtered=
, *test_case;
a127b154a8f2317 Daniel Latypov 2021-09-14  62  	struct kunit_suite *copy;
a127b154a8f2317 Daniel Latypov 2021-09-14  63  =

a127b154a8f2317 Daniel Latypov 2021-09-14  64  	kunit_suite_for_each_test_c=
ase(suite, test_case) {
a127b154a8f2317 Daniel Latypov 2021-09-14  65  		if (!test_glob || glob_mat=
ch(test_glob, test_case->name))
a127b154a8f2317 Daniel Latypov 2021-09-14  66  			++n;
a127b154a8f2317 Daniel Latypov 2021-09-14  67  	}
a127b154a8f2317 Daniel Latypov 2021-09-14  68  =

a127b154a8f2317 Daniel Latypov 2021-09-14  69  	if (n =3D=3D 0)
a127b154a8f2317 Daniel Latypov 2021-09-14  70  		return NULL;
a127b154a8f2317 Daniel Latypov 2021-09-14  71  =

d2fbdde838f2703 Daniel Latypov 2022-05-16  72  	copy =3D kmemdup(suite, siz=
eof(*copy), GFP_KERNEL);
a02353f491622e4 Daniel Latypov 2022-05-11  73  	if (!copy)
a02353f491622e4 Daniel Latypov 2022-05-11  74  		return ERR_PTR(-ENOMEM);
a127b154a8f2317 Daniel Latypov 2021-09-14  75  =

a127b154a8f2317 Daniel Latypov 2021-09-14  76  	filtered =3D kcalloc(n + 1,=
 sizeof(*filtered), GFP_KERNEL);
a02353f491622e4 Daniel Latypov 2022-05-11  77  	if (!filtered)
a02353f491622e4 Daniel Latypov 2022-05-11 @78  		return ERR_PTR(-ENOMEM);
a127b154a8f2317 Daniel Latypov 2021-09-14  79  =

a127b154a8f2317 Daniel Latypov 2021-09-14  80  	n =3D 0;
a127b154a8f2317 Daniel Latypov 2021-09-14  81  	kunit_suite_for_each_test_c=
ase(suite, test_case) {
a127b154a8f2317 Daniel Latypov 2021-09-14  82  		if (!test_glob || glob_mat=
ch(test_glob, test_case->name))
a127b154a8f2317 Daniel Latypov 2021-09-14  83  			filtered[n++] =3D *test_c=
ase;
a127b154a8f2317 Daniel Latypov 2021-09-14  84  	}
a127b154a8f2317 Daniel Latypov 2021-09-14  85  =

a127b154a8f2317 Daniel Latypov 2021-09-14  86  	copy->test_cases =3D filter=
ed;
a127b154a8f2317 Daniel Latypov 2021-09-14  87  	return copy;
a127b154a8f2317 Daniel Latypov 2021-09-14  88  }
5d31f71efcb6bce Daniel Latypov 2021-02-05  89  =


:::::: The code at line 78 was first introduced by commit
:::::: a02353f491622e49c7ddedc6a6dc4f1d6ed2150a kunit: bail out of test fil=
tering logic quicker if OOM

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3792670979000581636==--

