Content-Type: multipart/mixed; boundary="===============0624398695451745333=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/cifs-for-viro 5/8] fs/cifs/cifssmb.c: cifsfs.h is included more than once.
Date: Sun, 10 Jul 2022 09:53:26 +0800
Message-ID: <202207100924.Zh7upmAa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0624398695451745333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/cifs-f=
or-viro
head:   48e2f381e50cded57926128a7743a21573130f46
commit: d04aeaeed153b194dbc7d67525a59df325f2ce21 [5/8] cifs: Change the I/O=
 paths to use an iterator rather than a page list
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/cifs/cifssmb.c: cifsfs.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0624398695451745333==--

