Content-Type: multipart/mixed; boundary="===============2101397823482457233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/rcar_fdp1.c:691:9: warning: use of NULL 'job' where non-null expected [CWE-476]
Date: Mon, 15 Aug 2022 16:25:59 +0800
Message-ID: <202208151634.beH3iJjY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2101397823482457233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/renesas/rcar_fdp1.c:691:9: warning: use of NULL 'job' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Ren=
esas drivers on a separate dir
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220808 (https://download.01.org/0day-ci/archi=
ve/20220815/202208151634.beH3iJjY-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/renesas/rcar_fdp1.c: In function 'fdp1_job_free':
>> drivers/media/platform/renesas/rcar_fdp1.c:691:9: warning: use of NULL '=
job' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     691 |         memset(job, 0, sizeof(struct fdp1_job));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'fdp1_irq_handler': events 1-2
       |
       | 2205 | static irqreturn_t fdp1_irq_handler(int irq, void *dev_id)
       |      |                    ^~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (1) entry to 'fdp1_irq_handler'
       |......
       | 2242 |         if (!(FD1_CTL_IRQ_MASK & int_status))
       |      |            ~        =

       |      |            |
       |      |            (2) following 'false' branch...
       |
     'fdp1_irq_handler': events 3-6
       |
       | 2246 |         if (FD1_CTL_IRQ_VERE & int_status)
       |      |            ~                  =

       |      |            |
       |      |            (4) following 'true' branch...
       | 2247 |                 device_frame_end(fdp1, VB2_BUF_STATE_ERROR);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling 'device_frame_end' from 'fdp1_i=
rq_handler'
       |
       +--> 'device_frame_end': events 7-10
              |
              | 1305 | static void device_frame_end(struct fdp1_dev *fdp1,
              |      |             ^~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'device_frame_end'
              |......
              | 1316 |         if (ctx =3D=3D NULL) {
              |      |            ~ =

              |      |            |
              |      |            (8) following 'false' branch (when 'ctx' =
is non-NULL)...
              |......
              | 1322 |         ctx->num_processed++;
              |      |         ~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (9) ...to here
              |......
              | 1339 |         fdp1_job_free(fdp1, job);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (10) calling 'fdp1_job_free' from 'device_fr=
ame_end'
              |
              +--> 'fdp1_job_free': events 11-12
                     |
                     |  688 | static void fdp1_job_free(struct fdp1_dev *fd=
p1, struct fdp1_job *job)
                     |      |             ^~~~~~~~~~~~~
                     |      |             |
                     |      |             (11) entry to 'fdp1_job_free'
                     |......
                     |  691 |         memset(job, 0, sizeof(struct fdp1_job=
));
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
                     |      |         |
                     |      |         (12) argument 1 ('job') NULL where no=
n-null expected
                     |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/media/platform/renesas/rcar_fdp1.c:14:
   arch/arm/include/asm/string.h:31:15: note: argument 1 of 'memset' must b=
e non-null
      31 | extern void * memset(void *, int, __kernel_size_t);
         |               ^~~~~~
   drivers/media/platform/renesas/rcar_fdp1.c: In function 'device_frame_en=
d':
   drivers/media/platform/renesas/rcar_fdp1.c:1329:17: warning: dereference=
 of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1329 |                 fdp1_field_complete(ctx, job->previous);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'fdp1_irq_handler': events 1-2
       |
       | 2205 | static irqreturn_t fdp1_irq_handler(int irq, void *dev_id)
       |      |                    ^~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (1) entry to 'fdp1_irq_handler'
       |......
       | 2242 |         if (!(FD1_CTL_IRQ_MASK & int_status))
       |      |            ~        =

       |      |            |
       |      |            (2) following 'false' branch...
       |
     'fdp1_irq_handler': events 3-6
       |
       | 2246 |         if (FD1_CTL_IRQ_VERE & int_status)
       |      |            ~                  =

       |      |            |
       |      |            (4) following 'true' branch...
       | 2247 |                 device_frame_end(fdp1, VB2_BUF_STATE_ERROR);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling 'device_frame_end' from 'fdp1_i=
rq_handler'
       |

vim +/job +691 drivers/media/platform/renesas/rcar_fdp1.c

4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  687  =

4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  688  static void fdp1_job_free(struct fdp1_dev *fdp1, struct fdp1_job *j=
ob)
4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  689  {
4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  690  	/* Ensure that all residue from previous jobs is gone */
4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0 @691  	memset(job, 0, sizeof(struct fdp1_job));
4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  692  =

4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  693  	list_add_job(fdp1, &fdp1->free_job_list, job);
4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  694  }
4710b752e029f3f drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-3=
0  695  =


:::::: The code at line 691 was first introduced by commit
:::::: 4710b752e029f3f82dd4a84d9dc61fe72c97bf82 [media] v4l: Add Renesas R-=
Car FDP1 Driver

:::::: TO: Kieran Bingham <kieran+renesas@bingham.xyz>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2101397823482457233==--

