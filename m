Content-Type: multipart/mixed; boundary="===============3782009270028496002=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] ALSA: isa: Use INVALID_HWIRQ definition
Date: Sun, 17 Jul 2022 01:42:43 +0800
Message-ID: <202207170129.eH1SH9ub-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3782009270028496002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220715205737.83076-1-andriy.shevchenko@linux.intel.com>
References: <20220715205737.83076-1-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Takashi Iwai <tiwai@suse.de>
TO: alsa-devel(a)alsa-project.org
TO: linux-kernel(a)vger.kernel.org
CC: Jaroslav Kysela <perex@perex.cz>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ALSA=
-isa-Use-INVALID_HWIRQ-definition/20220716-230943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20220=
717/202207170129.eH1SH9ub-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/intel-lab-lkp/linux/commit/6549abbad6209d1e2c6=
0aa1ed28231649b5cffd8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/ALSA-isa-Use-INVAL=
ID_HWIRQ-definition/20220716-230943
        git checkout 6549abbad6209d1e2c60aa1ed28231649b5cffd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/isa/sscape.c: In function 'get_irq_config':
>> sound/isa/sscape.c:143:33: error: 'INVALID_HWIRQ' undeclared (first use =
in this function); did you mean 'INVALID_IRQ'?
     143 | #define INVALID_IRQ  ((unsigned)INVALID_HWIRQ)
         |                                 ^~~~~~~~~~~~~
   sound/isa/sscape.c:678:16: note: in expansion of macro 'INVALID_IRQ'
     678 |         return INVALID_IRQ;
         |                ^~~~~~~~~~~
   sound/isa/sscape.c:143:33: note: each undeclared identifier is reported =
only once for each function it appears in
     143 | #define INVALID_IRQ  ((unsigned)INVALID_HWIRQ)
         |                                 ^~~~~~~~~~~~~
   sound/isa/sscape.c:678:16: note: in expansion of macro 'INVALID_IRQ'
     678 |         return INVALID_IRQ;
         |                ^~~~~~~~~~~
   sound/isa/sscape.c: In function 'create_sscape':
>> sound/isa/sscape.c:143:33: error: 'INVALID_HWIRQ' undeclared (first use =
in this function); did you mean 'INVALID_IRQ'?
     143 | #define INVALID_IRQ  ((unsigned)INVALID_HWIRQ)
         |                                 ^~~~~~~~~~~~~
   sound/isa/sscape.c:994:24: note: in expansion of macro 'INVALID_IRQ'
     994 |         if (irq_cfg =3D=3D INVALID_IRQ) {
         |                        ^~~~~~~~~~~
   sound/isa/sscape.c: In function 'get_irq_config':
   sound/isa/sscape.c:679:1: error: control reaches end of non-void functio=
n [-Werror=3Dreturn-type]
     679 | }
         | ^
   cc1: some warnings being treated as errors


vim +143 sound/isa/sscape.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  142  =

6549abbad6209d Andy Shevchenko 2022-07-15 @143  #define INVALID_IRQ  ((unsi=
gned)INVALID_HWIRQ)
^1da177e4c3f41 Linus Torvalds  2005-04-16  144  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3782009270028496002==--

