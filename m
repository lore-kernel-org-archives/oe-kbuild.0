Content-Type: multipart/mixed; boundary="===============3947317468578834217=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [rcar:gmsl/dev 23/23] lib/vsprintf.c:800 ptr_to_id() warn: ignoring unreachable code.
Date: Tue, 11 Feb 2020 09:04:48 +0300
Message-ID: <20200211060447.GS24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3947317468578834217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git g=
msl/dev
head:   93aef18a872beaf24093f699268e56a484e31f64
commit: 93aef18a872beaf24093f699268e56a484e31f64 [23/23] lib: vsprint debug=
-ptrval

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/vsprintf.c:800 ptr_to_id() warn: ignoring unreachable code.

Old smatch warnings:
lib/vsprintf.c:1405 ip6_compressed_string() warn: possible spectre second h=
alf.  '*p'
lib/vsprintf.c:1408 ip6_compressed_string() warn: possible spectre second h=
alf.  '*p'

# https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git/commit/=
?id=3D93aef18a872beaf24093f699268e56a484e31f64
git remote add rcar https://git.kernel.org/pub/scm/linux/kernel/git/kbingha=
m/rcar.git
git remote update rcar
git checkout 93aef18a872beaf24093f699268e56a484e31f64
vim +800 lib/vsprintf.c

e4dcad204d3a28 Joel Fernandes (Google  2019-11-30  789) =

9073dac14e397f Geert Uytterhoeven      2018-10-11  790  static char *ptr_to=
_id(char *buf, char *end, const void *ptr,
9073dac14e397f Geert Uytterhoeven      2018-10-11  791  		       struct pri=
ntf_spec spec)
9073dac14e397f Geert Uytterhoeven      2018-10-11  792  {
9073dac14e397f Geert Uytterhoeven      2018-10-11  793  	const char *str =
=3D sizeof(ptr) =3D=3D 8 ? "(____ptrval____)" : "(ptrval)";
9073dac14e397f Geert Uytterhoeven      2018-10-11  794  	unsigned long hash=
val;
e4dcad204d3a28 Joel Fernandes (Google  2019-11-30  795) 	int ret;
9073dac14e397f Geert Uytterhoeven      2018-10-11  796  =

93aef18a872bea Laurent Pinchart        2020-02-10  797  	return pointer_str=
ing(buf, end, ptr, spec);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
93aef18a872bea Laurent Pinchart        2020-02-10  798  =

9073dac14e397f Geert Uytterhoeven      2018-10-11  799  	/* When debugging =
early boot use non-cryptographically secure hash. */
9073dac14e397f Geert Uytterhoeven      2018-10-11 @800  	if (unlikely(debug=
_boot_weak_hash)) {
9073dac14e397f Geert Uytterhoeven      2018-10-11  801  		hashval =3D hash_=
long((unsigned long)ptr, 32);
9073dac14e397f Geert Uytterhoeven      2018-10-11  802  		return pointer_st=
ring(buf, end, (const void *)hashval, spec);
9073dac14e397f Geert Uytterhoeven      2018-10-11  803  	}
9073dac14e397f Geert Uytterhoeven      2018-10-11  804  =

e4dcad204d3a28 Joel Fernandes (Google  2019-11-30  805) 	ret =3D __ptr_to_h=
ashval(ptr, &hashval);
e4dcad204d3a28 Joel Fernandes (Google  2019-11-30  806) 	if (ret) {
9073dac14e397f Geert Uytterhoeven      2018-10-11  807  		spec.field_width =
=3D 2 * sizeof(ptr);
9073dac14e397f Geert Uytterhoeven      2018-10-11  808  		/* string length =
must be less than default_width */
c8c3b584343cb7 Petr Mladek             2019-04-17  809  		return error_stri=
ng(buf, end, str, spec);
9073dac14e397f Geert Uytterhoeven      2018-10-11  810  	}
9073dac14e397f Geert Uytterhoeven      2018-10-11  811  =

9073dac14e397f Geert Uytterhoeven      2018-10-11  812  	return pointer_str=
ing(buf, end, (const void *)hashval, spec);
9073dac14e397f Geert Uytterhoeven      2018-10-11  813  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3947317468578834217==--

