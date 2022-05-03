Content-Type: multipart/mixed; boundary="===============1451371384692046224=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/alpha/lib/csum_partial_copy.c:96:15: warning: Uninitialized variable: word [uninitvar]
Date: Wed, 04 May 2022 01:12:30 +0800
Message-ID: <202205040137.Qo9HuNjE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1451371384692046224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 0214967a376d0726baf35cc2845a59ac17ef4db1 alpha: csum_partial_copy.c=
: add function prototypes from <net/checksum.h>
date:   12 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 12 months ago
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0214967a376d0726baf35cc2845a59ac17ef4db1
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/alpha/lib/csum_partial_copy.c:96:15: warning: Uninitialized variabl=
e: word [uninitvar]
     checksum +=3D word;
                 ^
>> arch/alpha/lib/csum_partial_copy.c:96:15: warning: Uninitialized variabl=
e: word [uninitvar]
     checksum +=3D word;
                 ^
   arch/alpha/lib/csum_partial_copy.c:92:7: note: Assuming condition is fal=
se
     if (__get_word(ldq, word, src))
         ^
   arch/alpha/lib/csum_partial_copy.c:96:15: note: Uninitialized variable: =
word
     checksum +=3D word;
                 ^

vim +96 arch/alpha/lib/csum_partial_copy.c

^1da177e4c3f41 Linus Torvalds 2005-04-16   77  =

^1da177e4c3f41 Linus Torvalds 2005-04-16   78  =

^1da177e4c3f41 Linus Torvalds 2005-04-16   79  =

^1da177e4c3f41 Linus Torvalds 2005-04-16   80  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16   81   * Ok. This isn't fun, but t=
his is the EASY case.
^1da177e4c3f41 Linus Torvalds 2005-04-16   82   */
^1da177e4c3f41 Linus Torvalds 2005-04-16   83  static inline unsigned long
^1da177e4c3f41 Linus Torvalds 2005-04-16   84  csum_partial_cfu_aligned(con=
st unsigned long __user *src, unsigned long *dst,
b712139543af98 Al Viro        2020-07-12   85  			 long len)
^1da177e4c3f41 Linus Torvalds 2005-04-16   86  {
b712139543af98 Al Viro        2020-07-12   87  	unsigned long checksum =3D =
~0U;
^1da177e4c3f41 Linus Torvalds 2005-04-16   88  	unsigned long carry =3D 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16   89  =

^1da177e4c3f41 Linus Torvalds 2005-04-16   90  	while (len >=3D 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16   91  		unsigned long word;
b712139543af98 Al Viro        2020-07-12   92  		if (__get_word(ldq, word, =
src))
b712139543af98 Al Viro        2020-07-12   93  			return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16   94  		checksum +=3D carry;
^1da177e4c3f41 Linus Torvalds 2005-04-16   95  		src++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  @96  		checksum +=3D word;
^1da177e4c3f41 Linus Torvalds 2005-04-16   97  		len -=3D 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16   98  		carry =3D checksum < word;
^1da177e4c3f41 Linus Torvalds 2005-04-16   99  		*dst =3D word;
^1da177e4c3f41 Linus Torvalds 2005-04-16  100  		dst++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  101  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  102  	len +=3D 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16  103  	checksum +=3D carry;
^1da177e4c3f41 Linus Torvalds 2005-04-16  104  	if (len) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  105  		unsigned long word, tmp;
b712139543af98 Al Viro        2020-07-12  106  		if (__get_word(ldq, word, =
src))
b712139543af98 Al Viro        2020-07-12  107  			return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  108  		tmp =3D *dst;
^1da177e4c3f41 Linus Torvalds 2005-04-16  109  		mskql(word, len, word);
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  		checksum +=3D word;
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  		mskqh(tmp, len, tmp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  112  		carry =3D checksum < word;
^1da177e4c3f41 Linus Torvalds 2005-04-16  113  		*dst =3D word | tmp;
^1da177e4c3f41 Linus Torvalds 2005-04-16  114  		checksum +=3D carry;
^1da177e4c3f41 Linus Torvalds 2005-04-16  115  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  116  	return checksum;
^1da177e4c3f41 Linus Torvalds 2005-04-16  117  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  118  =


:::::: The code@line 96 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1451371384692046224==--

