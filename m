Content-Type: multipart/mixed; boundary="===============4551321930121282881=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cryptodev:master 110/119] drivers/crypto/gemini/sl3516-ce-cipher.c: linux/io.h is included more than once.
Date: Fri, 11 Jun 2021 17:08:02 +0800
Message-ID: <202106111714.8a43PF68-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4551321930121282881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-crypto(a)vger.kernel.org
TO: Corentin Labbe <clabbe@baylibre.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: linux-crypto(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
head:   0dc64297c8ac98503a7c7621b3c78e151deb75b6
commit: 46c5338db7bd45b2cf99570560f00389d60fd6b4 [110/119] crypto: sl3516 -=
 Add sl3516 crypto engine
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/crypto/gemini/sl3516-ce-cipher.c: linux/io.h is included more th=
an once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4551321930121282881==--

