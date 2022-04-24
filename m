Content-Type: multipart/mixed; boundary="===============0802696009031944229=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/rc/meson-ir-tx.c:159:20: warning: Parameter 'buf' can be declared with const [constParameter]
Date: Sun, 24 Apr 2022 20:48:53 +0800
Message-ID: <202204242041.pY5vF1uS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0802696009031944229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sean Young <sean@mess.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   22da5264abf497a10a4ed629f07f4ba28a7ed5eb
commit: 49be1c78d575eedf862a05aebfd5ab5c24193f61 media: rc: introduce Meson=
 IR TX driver
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 49be1c78d575eedf862a05aebfd5ab5c24193f61
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:731:10: warning: Unused variab=
le value 'qmenu_int_vpx_num_partitions' [constStatement]
     return __v4l2_qmenu_int_len(qmenu_int_vpx_num_partitions, len);
            ^
>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:733:10: warning: Unused variab=
le value 'qmenu_int_vpx_num_ref_frames' [constStatement]
     return __v4l2_qmenu_int_len(qmenu_int_vpx_num_ref_frames, len);
            ^
--
>> drivers/media/rc/meson-ir-tx.c:159:20: warning: Parameter 'buf' can be d=
eclared with const [constParameter]
        unsigned int *buf, unsigned int len)
                      ^

vim +/buf +159 drivers/media/rc/meson-ir-tx.c

49be1c78d575eed Viktor Prutyanov 2021-07-19  157  =

49be1c78d575eed Viktor Prutyanov 2021-07-19  158  static bool meson_irtx_ch=
eck_buf(struct meson_irtx *ir,
49be1c78d575eed Viktor Prutyanov 2021-07-19 @159  				 unsigned int *buf, u=
nsigned int len)
49be1c78d575eed Viktor Prutyanov 2021-07-19  160  {
49be1c78d575eed Viktor Prutyanov 2021-07-19  161  	unsigned int i;
49be1c78d575eed Viktor Prutyanov 2021-07-19  162  =

49be1c78d575eed Viktor Prutyanov 2021-07-19  163  	for (i =3D 0; i < len; i=
++) {
49be1c78d575eed Viktor Prutyanov 2021-07-19  164  		unsigned int max_tb_us;
49be1c78d575eed Viktor Prutyanov 2021-07-19  165  		/*
49be1c78d575eed Viktor Prutyanov 2021-07-19  166  		 * Max space timebase i=
s 100 us.
49be1c78d575eed Viktor Prutyanov 2021-07-19  167  		 * Pulse timebase equal=
s to carrier period.
49be1c78d575eed Viktor Prutyanov 2021-07-19  168  		 */
49be1c78d575eed Viktor Prutyanov 2021-07-19  169  		if (i % 2 =3D=3D 0)
49be1c78d575eed Viktor Prutyanov 2021-07-19  170  			max_tb_us =3D USEC_PER=
_SEC / ir->carrier;
49be1c78d575eed Viktor Prutyanov 2021-07-19  171  		else
49be1c78d575eed Viktor Prutyanov 2021-07-19  172  			max_tb_us =3D 100;
49be1c78d575eed Viktor Prutyanov 2021-07-19  173  =

49be1c78d575eed Viktor Prutyanov 2021-07-19  174  		if (buf[i] >=3D max_tb_=
us * IRB_MAX_DELAY)
49be1c78d575eed Viktor Prutyanov 2021-07-19  175  			return false;
49be1c78d575eed Viktor Prutyanov 2021-07-19  176  	}
49be1c78d575eed Viktor Prutyanov 2021-07-19  177  =

49be1c78d575eed Viktor Prutyanov 2021-07-19  178  	return true;
49be1c78d575eed Viktor Prutyanov 2021-07-19  179  }
49be1c78d575eed Viktor Prutyanov 2021-07-19  180  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0802696009031944229==--

