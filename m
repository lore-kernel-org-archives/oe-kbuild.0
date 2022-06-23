Content-Type: multipart/mixed; boundary="===============4223864382291071111=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/state_dump.c:79:9: warning: use of NULL 'buf' where non-null expected [CWE-476]
Date: Fri, 24 Jun 2022 01:34:11 +0800
Message-ID: <202206240134.NCtH9OQo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4223864382291071111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
isc/habanalabs/common/state_dump.c:79:9: warning: use of NULL 'buf' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yuri Nudelman <ynudelman@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   399bd66e219e331976fe6fa6ab81a023c0c97870
commit: 938b793fdede518e10c67dc1dcfba1804faf98a6 habanalabs: expose state d=
ump
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220622 (https://download.01.org/0day-ci/archi=
ve/20220624/202206240134.NCtH9OQo-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D938b793fdede518e10c67dc1dcfba1804faf98a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 938b793fdede518e10c67dc1dcfba1804faf98a6
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/misc/habanalabs/common/state_dump.c: In function 'resize_to_fit':
>> drivers/misc/habanalabs/common/state_dump.c:79:9: warning: use of NULL '=
buf' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
      79 |         memcpy(resized_buf, *buf, *size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'hl_state_dump': event 1
       |
       |  428 | int hl_state_dump(struct hl_device *hdev)
       |      |     ^~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'hl_state_dump'
       |
     'hl_state_dump': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kbuf=1B[m=1B[K' is NULL
       |
     'hl_state_dump': event 3
       |
       |  434 |         rc =3D hl_snprintf_resize(&buf, &size, &offset,
       |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (3) calling 'hl_snprintf_resize' from 'hl_stat=
e_dump'
       |  435 |                                 "Timestamp taken on: %llu\n=
\n",
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |  436 |                                 ktime_to_ns(ktime_get()));
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'hl_snprintf_resize': events 4-9
              |
              |  104 | int hl_snprintf_resize(char **buf, size_t *size, siz=
e_t *offset,
              |      |     ^~~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (4) entry to 'hl_snprintf_resize'
              |......
              |  111 |         if (*buf =3D=3D NULL && (*size !=3D 0 || *of=
fset !=3D 0))
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
              |      |            ||            |   |
              |      |            ||            |   (8) ...to here
              |      |            ||            (9) following 'false' branc=
h...
              |      |            |(5) 'buf' is NULL
              |      |            |(6) 'buf' is NULL
              |      |            (7) following 'true' branch...
              |
            'hl_snprintf_resize': event 10
              |
              |  114 |         va_start(args, format);
              |      |         ^~~~~~~~
              |      |         |
              |      |         (10) ...to here
              |
            'hl_snprintf_resize': events 11-13
              |
              |  115 |         length =3D vsnprintf(*buf + *offset, *size -=
 *offset, format, args);
              |      |                  ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |      |                  |         |
              |      |                  |         (11) 'buf' is NULL
              |      |                  (12) 'buf' is NULL
              |......
              |  118 |         rc =3D resize_to_fit(buf, size, *offset + le=
ngth + 1);
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
              |      |              |
              |      |              (13) calling 'resize_to_fit' from 'hl_s=
nprintf_resize'
              |
              +--> 'resize_to_fit': events 14-15
                     |
                     |   66 | static int resize_to_fit(char **buf, size_t *=
size, size_t desired_size)
                     |      |            ^~~~~~~~~~~~~
                     |      |            |
                     |      |            (14) entry to 'resize_to_fit'
                     |......
                     |   71 |         if (*size >=3D desired_size)
                     |      |            ~
                     |      |            |
                     |      |            (15) following 'false' branch...
                     |
                   'resize_to_fit': event 16
                     |
                     |include/linux/math.h:24:30:
                     |   24 | #define round_up(x, y) ((((x)-1) | __round_ma=
sk(x, y))+1)
                     |      |                          ~~~~^~~
                     |      |                              |
                     |      |                              (16) ...to here
   include/linux/minmax.h:32:39: note: in definition of macro '__cmp_once'
                     |   32 |                 typeof(y) unique_y =3D (y);  =
             \
                     |      |                                       ^
   include/linux/minmax.h:112:33: note: in expansion of macro '__careful_cm=
p'
                     |  112 | #define max_t(type, x, y)       __careful_cmp=
((type)(x), (type)(y), >)
                     |      |                                 ^~~~~~~~~~~~~
   drivers/misc/habanalabs/common/state_dump.c:75:20: note: in expansion of=
 macro 'max_t'
                     |   75 |         new_size =3D max_t(size_t, PAGE_SIZE,=
 round_up(desired_size, PAGE_SIZE));
                     |      |                    ^~~~~
   drivers/misc/habanalabs/common/state_dump.c:75:45: note: in expansion of=
 macro 'round_up'
                     |   75 |         new_size =3D max_t(size_t, PAGE_SIZE,=
 round_up(desired_size, PAGE_SIZE));
                     |      |                                             ^=
~~~~~~~
                     |
                   'resize_to_fit': events 17-21
                     |
                     |   77 |         if (!resized_buf)
                     |      |            ^
                     |      |            |
                     |      |            (17) following 'false' branch (whe=
n 'resized_buf' is non-NULL)...
                     |   78 |                 return -ENOMEM;

vim +/buf +79 drivers/misc/habanalabs/common/state_dump.c

938b793fdede51 Yuri Nudelman 2021-06-06  55  =

938b793fdede51 Yuri Nudelman 2021-06-06  56  /**
938b793fdede51 Yuri Nudelman 2021-06-06  57   * resize_to_fit - helper func=
tion, resize buffer to fit given amount of data
938b793fdede51 Yuri Nudelman 2021-06-06  58   * @buf: destination buffer do=
uble pointer
938b793fdede51 Yuri Nudelman 2021-06-06  59   * @size: pointer to the size =
container
938b793fdede51 Yuri Nudelman 2021-06-06  60   * @desired_size: size the buf=
fer must contain
938b793fdede51 Yuri Nudelman 2021-06-06  61   *
938b793fdede51 Yuri Nudelman 2021-06-06  62   * Returns 0 on success or err=
or code on failure.
938b793fdede51 Yuri Nudelman 2021-06-06  63   * On success, the size of buf=
fer is at least desired_size. Buffer is allocated
938b793fdede51 Yuri Nudelman 2021-06-06  64   * via vmalloc and must be fre=
ed with vfree.
938b793fdede51 Yuri Nudelman 2021-06-06  65   */
938b793fdede51 Yuri Nudelman 2021-06-06  66  static int resize_to_fit(char =
**buf, size_t *size, size_t desired_size)
938b793fdede51 Yuri Nudelman 2021-06-06  67  {
938b793fdede51 Yuri Nudelman 2021-06-06  68  	char *resized_buf;
938b793fdede51 Yuri Nudelman 2021-06-06  69  	size_t new_size;
938b793fdede51 Yuri Nudelman 2021-06-06  70  =

938b793fdede51 Yuri Nudelman 2021-06-06  71  	if (*size >=3D desired_size)
938b793fdede51 Yuri Nudelman 2021-06-06  72  		return 0;
938b793fdede51 Yuri Nudelman 2021-06-06  73  =

938b793fdede51 Yuri Nudelman 2021-06-06  74  	/* Not enough space to print =
all, have to resize */
938b793fdede51 Yuri Nudelman 2021-06-06  75  	new_size =3D max_t(size_t, PA=
GE_SIZE, round_up(desired_size, PAGE_SIZE));
938b793fdede51 Yuri Nudelman 2021-06-06  76  	resized_buf =3D vmalloc(new_s=
ize);
938b793fdede51 Yuri Nudelman 2021-06-06  77  	if (!resized_buf)
938b793fdede51 Yuri Nudelman 2021-06-06  78  		return -ENOMEM;
938b793fdede51 Yuri Nudelman 2021-06-06 @79  	memcpy(resized_buf, *buf, *si=
ze);
938b793fdede51 Yuri Nudelman 2021-06-06  80  	vfree(*buf);
938b793fdede51 Yuri Nudelman 2021-06-06  81  	*buf =3D resized_buf;
938b793fdede51 Yuri Nudelman 2021-06-06  82  	*size =3D new_size;
938b793fdede51 Yuri Nudelman 2021-06-06  83  =

938b793fdede51 Yuri Nudelman 2021-06-06  84  	return 1;
938b793fdede51 Yuri Nudelman 2021-06-06  85  }
938b793fdede51 Yuri Nudelman 2021-06-06  86  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4223864382291071111==--

