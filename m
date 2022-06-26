Content-Type: multipart/mixed; boundary="===============3822959671770580905=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/ipu-v3/ipu-image-convert.c:1955:34: warning: shift by count ('4294967295') >= precision of type ('32')
Date: Sun, 26 Jun 2022 20:57:30 +0800
Message-ID: <202206262021.a2EgeIrE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3822959671770580905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/ipu-v3/ipu-image-convert.c:1955:34: warning: shift by count ('=
4294967295') >=3D precision of type ('32') [-Wanalyzer-shift-count-overflow=
]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0840a7914caa14315a3191178a9f72c742477860
commit: f334f5668bedf7307f6df1d98b14f55902931926 ilog2: force inlining of _=
_ilog2_u32() and __ilog2_u64()
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220624
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df334f5668bedf7307f6df1d98b14f55902931926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f334f5668bedf7307f6df1d98b14f55902931926
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
                                          |      |                 ~~ ~   =

                                          |      |                 |  |
                                          |      |                 |  (28) =
following 'false' branch...
                                          |      |                 (27) ...=
to here
                                          |
                                   <------+
                                   |
                                 'ipu_image_convert_adjust': events 30-31
                                   |
                                   | 1985 |                 outfmt =3D get_=
format(V4L2_PIX_FMT_RGB24);
                                   |      |                          ^~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                          |
                                   |      |                          (30) r=
eturn of NULL to 'ipu_image_convert_adjust' from 'get_format'
                                   |......
                                   | 2011 |         in->pix.height =3D clam=
p_align(in->pix.height, MIN_H, MAX_H,
                                   |      |                          ~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                          |
                                   |      |                          (31) c=
alling 'clamp_align' from 'ipu_image_convert_adjust'
                                   | 2012 |                                =
      h_align_in);
                                   |      |                                =
      ~~~~~~~~~~~
                                   |
                                   +--> 'clamp_align': events 32-34
                                          |
                                          | 1951 | static unsigned int clam=
p_align(unsigned int x, unsigned int min,
                                          |      |                     ^~~~=
~~~~~~~
                                          |      |                     |
                                          |      |                     (32)=
 entry to 'clamp_align'
                                          |......
                                          | 1961 |         if (align)
                                          |      |            ~         =

                                          |      |            |
                                          |      |            (33) followin=
g 'true' branch (when 'align !=3D 0')...
                                          | 1962 |                 x =3D (x=
 + (1 << (align - 1))) & mask;
                                          |      |                 ~    =

                                          |      |                 |
                                          |      |                 (34) ...=
to here
                                          |
                                   <------+
                                   |
                                 'ipu_image_convert_adjust': event 35
                                   |
                                   | 2011 |         in->pix.height =3D clam=
p_align(in->pix.height, MIN_H, MAX_H,
                                   |      |                          ^~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                          |
                                   |      |                          (35) r=
eturning to 'ipu_image_convert_adjust' from 'clamp_align'
                                   | 2012 |                                =
      h_align_in);
                                   |      |                                =
      ~~~~~~~~~~~
                                   |
                                 'ipu_image_convert_adjust': event 36
                                   |
                                   |include/linux/log2.h:160:35:
                                   |  157 | ( \
                                   |      | ~~~                            =
    =

                                   |  158 |         __builtin_constant_p(n)=
 ?       \
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |  159 |         ((n) < 2 ? 0 :         =
         \
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |  160 |          63 - __builtin_clzll(n=
)) :     \
                                   |      |          ~~~~~~~~~~~~~~~~~~~~~~=
~~~^~~~~~~
                                   |      |                                =
   |
                                   |      |                                =
   (36) calling 'tile_width_align' from 'ipu_image_convert_adjust'
                                   |  161 |         (sizeof(n) <=3D 4) ?   =
           \
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |  162 |         __ilog2_u32(n) :       =
         \
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |  163 |         __ilog2_u64(n)         =
         \
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |  164 |  )
                                   |      |  ~                             =
    =

   drivers/gpu/ipu-v3/ipu-image-convert.c:2015:23: note: in expansion of ma=
cro 'ilog2'
                                   | 2015 |         w_align_out =3D ilog2(t=
ile_width_align(IMAGE_CONVERT_OUT, outfmt,
                                   |      |                       ^~~~~
                                   |
                                   +--> 'tile_width_align': events 37-42
                                          |
                                          |  619 | static inline u32 tile_w=
idth_align(enum ipu_image_convert_type type,
                                          |      |                   ^~~~~~=
~~~~~~~~~~
                                          |      |                   |
                                          |      |                   (37) e=
ntry to 'tile_width_align'
                                          |......
                                          |  623 |         if (type =3D=3D =
IMAGE_CONVERT_IN) {
                                          |      |            ~       =

                                          |      |            |
                                          |      |            (38) followin=
g 'false' branch (when 'type !=3D 0')...
                                          |......
                                          |  640 |         return (ipu_rot_=
mode_is_irt(rot_mode) &&
                                          |      |         ~~~~~~ ~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |         |
                                          |      |         (39) ...to here
                                          |  641 |                 fmt->pla=
nar && !fmt->uv_packed) ?
                                          |      |                 ~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |                    |
                                          |      |                    (41) =
...to here
                                          |      |                    (42) =
dereference of NULL 'fmt'
                                          |  642 |                 8 * fmt-=
>uv_width_dec : 8;
                                          |      |                 ~~~~~~~~=
~~~~~~~~~~~~~~~~~
                                          |      |                         =
              |
                                          |      |                         =
              (40) following 'true' branch...
                                          |
   drivers/gpu/ipu-v3/ipu-image-convert.c: In function 'clamp_align':
>> drivers/gpu/ipu-v3/ipu-image-convert.c:1955:34: warning: shift by count =
('4294967295') >=3D precision of type ('32') [-Wanalyzer-shift-count-overfl=
ow]
    1955 |         unsigned int mask =3D ~((1 << align) - 1);
         |                               ~~~^~~~~~~~~
     'ipu_image_convert_sync': events 1-2
       |
       | 2453 | int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic=
_task ic_task,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ipu_image_convert_sync'
       |......
       | 2463 |         run =3D ipu_image_convert(ipu, ic_task, in, out, ro=
t_mode,
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |               |
       |      |               (2) calling 'ipu_image_convert' from 'ipu_ima=
ge_convert_sync'
       | 2464 |                                 image_convert_sync_complete=
, &comp);
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |
       +--> 'ipu_image_convert': events 3-4
              |
              | 2408 | ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_t=
ask ic_task,
              |      | ^~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'ipu_image_convert'
              |......
              | 2418 |         ctx =3D ipu_image_convert_prepare(ipu, ic_ta=
sk, in, out, rot_mode,
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (4) calling 'ipu_image_convert_prepare=
' from 'ipu_image_convert'
              | 2419 |                                         complete, co=
mplete_context);
              |      |                                         ~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
              |
              +--> 'ipu_image_convert_prepare': events 5-8
                     |
                     | 2073 | ipu_image_convert_prepare(struct ipu_soc *ipu=
, enum ipu_ic_task ic_task,
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (5) entry to 'ipu_image_convert_prepare'
                     |......
                     | 2088 |         if (!in || !out || !complete ||
                     |      |            ~
                     |      |            |
                     |      |            (6) following 'false' branch...
                     |......
                     | 2094 |         ret =3D ipu_image_convert_verify(in, =
out, rot_mode);
                     |      |         ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
                     |      |         |     |
                     |      |         |     (8) calling 'ipu_image_convert_=
verify' from 'ipu_image_convert_prepare'
                     |      |         (7) ...to here
                     |
                     +--> 'ipu_image_convert_verify': events 9-10
                            |
                            | 2048 | int ipu_image_convert_verify(struct ip=
u_image *in, struct ipu_image *out,
                            |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
                            |      |     |
                            |      |     (9) entry to 'ipu_image_convert_ve=
rify'
                            |......
                            | 2056 |         ipu_image_convert_adjust(&test=
in, &testout, rot_mode);
                            |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
                            |      |         |
                            |      |         (10) calling 'ipu_image_conver=
t_adjust' from 'ipu_image_convert_verify'
                            |
                            +--> 'ipu_image_convert_adjust': events 11-12
                                   |
                                   | 1968 | void ipu_image_convert_adjust(s=
truct ipu_image *in, struct ipu_image *out,
                                   |      |      ^~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |      |
                                   |      |      (11) entry to 'ipu_image_c=
onvert_adjust'
                                   |......
                                   | 1975 |         infmt =3D get_format(in=
->pix.pixelformat);
                                   |      |                 ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
                                   |      |                 |
                                   |      |                 (12) calling 'g=
et_format' from 'ipu_image_convert_adjust'
                                   |
                                   +--> 'get_format': event 13
                                          |
                                          |  322 | static const struct ipu_=
image_pixfmt *get_format(u32 fourcc)
                                          |      |                         =
              ^~~~~~~~~~
                                          |      |                         =
              |
                                          |      |                         =
              (13) entry to 'get_format'
                                          |
                                        'get_format': events 14-15
                                          |
                                          |  327 |         for (i =3D 0; i =
< ARRAY_SIZE(image_convert_formats); i++) {
                                          |  328 |                 if (imag=
e_convert_formats[i].fourcc =3D=3D fourcc) {
                                          |      |                 ~~     =

                                          |      |                 |
                                          |      |                 (15) ...=
to here
                                          |
                                   <------+
                                   |
                                 'ipu_image_convert_adjust': events 16-17
                                   |
                                   | 1975 |         infmt =3D get_format(in=
->pix.pixelformat);
                                   |      |                 ^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
                                   |      |                 |
                                   |      |                 (16) returning =
to 'ipu_image_convert_adjust' from 'get_format'
                                   | 1976 |         outfmt =3D get_format(o=
ut->pix.pixelformat);
                                   |      |                  ~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
                                   |      |                  |
                                   |      |                  (17) calling '=
get_format' from 'ipu_image_convert_adjust'
                                   |

vim +1955 drivers/gpu/ipu-v3/ipu-image-convert.c

cd98e85a6b786d Steve Longerbeam 2016-09-17  1949  =

cd98e85a6b786d Steve Longerbeam 2016-09-17  1950  /* borrowed from drivers/=
media/v4l2-core/v4l2-common.c */
cd98e85a6b786d Steve Longerbeam 2016-09-17  1951  static unsigned int clamp=
_align(unsigned int x, unsigned int min,
cd98e85a6b786d Steve Longerbeam 2016-09-17  1952  				unsigned int max, uns=
igned int align)
cd98e85a6b786d Steve Longerbeam 2016-09-17  1953  {
cd98e85a6b786d Steve Longerbeam 2016-09-17  1954  	/* Bits that must be zer=
o to be aligned */
cd98e85a6b786d Steve Longerbeam 2016-09-17 @1955  	unsigned int mask =3D ~(=
(1 << align) - 1);
cd98e85a6b786d Steve Longerbeam 2016-09-17  1956  =

cd98e85a6b786d Steve Longerbeam 2016-09-17  1957  	/* Clamp to aligned min =
and max */
cd98e85a6b786d Steve Longerbeam 2016-09-17  1958  	x =3D clamp(x, (min + ~m=
ask) & mask, max & mask);
cd98e85a6b786d Steve Longerbeam 2016-09-17  1959  =

cd98e85a6b786d Steve Longerbeam 2016-09-17  1960  	/* Round to nearest alig=
ned value */
cd98e85a6b786d Steve Longerbeam 2016-09-17  1961  	if (align)
cd98e85a6b786d Steve Longerbeam 2016-09-17  1962  		x =3D (x + (1 << (align=
 - 1))) & mask;
cd98e85a6b786d Steve Longerbeam 2016-09-17  1963  =

cd98e85a6b786d Steve Longerbeam 2016-09-17  1964  	return x;
cd98e85a6b786d Steve Longerbeam 2016-09-17  1965  }
cd98e85a6b786d Steve Longerbeam 2016-09-17  1966  =


:::::: The code@line 1955 was first introduced by commit
:::::: cd98e85a6b786da83e0b120b53a182d100c19c9b gpu: ipu-v3: Add queued ima=
ge conversion support

:::::: TO: Steve Longerbeam <slongerbeam@gmail.com>
:::::: CC: Philipp Zabel <p.zabel@pengutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3822959671770580905==--

