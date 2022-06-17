Content-Type: multipart/mixed; boundary="===============2274913778703460865=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma-buf/sync_debug.c:134:38: warning: dereference of NULL '0' [CWE-476]
Date: Sat, 18 Jun 2022 05:01:09 +0800
Message-ID: <202206180450.gNuiUkYe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2274913778703460865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/dma-buf/sync_debug.c:134:38: warning: dereference of NULL '0' [CWE=
-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   274295c6e53f8b8b8dfa8b24a3fcb8a9d670c22c
commit: 976b6d97c62347df3e686f60a5f455bb8ed6ea23 dma-buf: consolidate dma_f=
ence subclass checking
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220616 (https://download.01.org/0day-ci/archi=
ve/20220618/202206180450.gNuiUkYe-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D976b6d97c62347df3e686f60a5f455bb8ed6ea23
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 976b6d97c62347df3e686f60a5f455bb8ed6ea23
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   include/linux/dma-fence-array.h: In function 'sync_print_sync_file':
>> drivers/dma-buf/sync_debug.c:134:38: warning: dereference of NULL '0' [C=
WE-476] [-Wanalyzer-null-dereference]
     134 |                 for (i =3D 0; i < array->num_fences; ++i)
         |                                 ~~~~~^~~~~~~~~~~~
     'sync_info_debugfs_show': event 1
       |
       |  141 | static int sync_info_debugfs_show(struct seq_file *s, void =
*unused)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'sync_info_debugfs_show'
       |
     'sync_info_debugfs_show': event 2
       |
       |include/linux/list.h:580:34:
       |  580 |         for (pos =3D (head)->next; !list_is_head(pos, (head=
)); pos =3D pos->next)
       |      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                  |
       |      |                                  (2) following 'false' bran=
ch...
   drivers/dma-buf/sync_debug.c:148:9: note: in expansion of macro 'list_fo=
r_each'
       |  148 |         list_for_each(pos, &sync_timeline_list_head) {
       |      |         ^~~~~~~~~~~~~
       |
     'sync_info_debugfs_show': event 3
       |
       |arch/arm/include/asm/irqflags.h:39:9:
       |   39 |         asm volatile(
       |      |         ^~~
       |      |         |
       |      |         (3) ...to here
       |
     'sync_info_debugfs_show': event 4
       |
       |include/linux/list.h:580:34:
       |  580 |         for (pos =3D (head)->next; !list_is_head(pos, (head=
)); pos =3D pos->next)
       |      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                  |
       |      |                                  (4) following 'true' branc=
h...
   drivers/dma-buf/sync_debug.c:161:9: note: in expansion of macro 'list_fo=
r_each'
       |  161 |         list_for_each(pos, &sync_file_list_head) {
       |      |         ^~~~~~~~~~~~~
       |
     'sync_info_debugfs_show': event 5
       |
       |include/linux/container_of.h:22:10:
       |   22 |         ((type *)(__mptr - offsetof(type, member))); })
       |      |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |          |
       |      |          (5) ...to here
   drivers/dma-buf/sync_debug.c:163:25: note: in expansion of macro 'contai=
ner_of'
       |  163 |                         container_of(pos, struct sync_file,=
 sync_file_list);
       |      |                         ^~~~~~~~~~~~
       |
     'sync_info_debugfs_show': event 6
       |
       |  165 |                 sync_print_sync_file(s, sync_file);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) calling 'sync_print_sync_file' from 'sy=
nc_info_debugfs_show'
       |
       +--> 'sync_print_sync_file': event 7
              |
              |  121 | static void sync_print_sync_file(struct seq_file *s,
              |      |             ^~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'sync_print_sync_file'
              |
            'sync_print_sync_file': event 8
              |
              |include/linux/dma-fence-array.h:58:12:
              |   58 |         if (!fence || !dma_fence_is_array(fence))
              |      |            ^
              |      |            |
              |      |            (8) following 'false' branch...
              |
            'sync_print_sync_file': event 9
              |
              |cc1:
              | (9): ...to here
              |
       <------+
       |
     'sync_info_debugfs_show': event 10
       |
       |drivers/dma-buf/sync_debug.c:165:17:
       |  165 |                 sync_print_sync_file(s, sync_file);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (10) returning to 'sync_info_debugfs_show' =
from 'sync_print_sync_file'
       |
     'sync_info_debugfs_show': event 11
       |
       |include/linux/list.h:580:34:
       |  580 |         for (pos =3D (head)->next; !list_is_head(pos, (head=
)); pos =3D pos->next)
       |      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                  |
       |      |                                  (11) following 'true' bran=
ch...
   drivers/dma-buf/sync_debug.c:161:9: note: in expansion of macro 'list_fo=
r_each'
       |  161 |         list_for_each(pos, &sync_file_list_head) {
       |      |         ^~~~~~~~~~~~~
       |
     'sync_info_debugfs_show': event 12
       |

vim +/0 +134 drivers/dma-buf/sync_debug.c

0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  120  =

d7fdb0ae9d115fa drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-01-21  121  static void sync_print_sync_file(struct seq_file *s,
d7fdb0ae9d115fa drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-01-21  122  				  struct sync_file *sync_file)
0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  123  {
71ebc9a3795818e drivers/dma-buf/sync_debug.c         Chris Wilson      2017=
-05-16  124  	char buf[128];
0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  125  	int i;
0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  126  =

71ebc9a3795818e drivers/dma-buf/sync_debug.c         Chris Wilson      2017=
-05-16  127  	seq_printf(s, "[%p] %s: %s\n", sync_file,
71ebc9a3795818e drivers/dma-buf/sync_debug.c         Chris Wilson      2017=
-05-16  128  		   sync_file_get_name(sync_file, buf, sizeof(buf)),
d6c99f4bf093a58 drivers/dma-buf/sync_debug.c         Chris Wilson      2017=
-01-04  129  		   sync_status_str(dma_fence_get_status(sync_file->fence)));
0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  130  =

f54d1867005c332 drivers/dma-buf/sync_debug.c         Chris Wilson      2016=
-10-25  131  	if (dma_fence_is_array(sync_file->fence)) {
f54d1867005c332 drivers/dma-buf/sync_debug.c         Chris Wilson      2016=
-10-25  132  		struct dma_fence_array *array =3D to_dma_fence_array(sync_fi=
le->fence);
a02b9dc90d844cc drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-08-05  133  =

a02b9dc90d844cc drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-08-05 @134  		for (i =3D 0; i < array->num_fences; ++i)
a02b9dc90d844cc drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-08-05  135  			sync_print_fence(s, array->fences[i], true);
a02b9dc90d844cc drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-08-05  136  	} else {
a02b9dc90d844cc drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-08-05  137  		sync_print_fence(s, sync_file->fence, true);
a02b9dc90d844cc drivers/staging/android/sync_debug.c Gustavo Padovan   2016=
-08-05  138  	}
0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  139  }
0f0d8406fb9c3c5 drivers/staging/android/sync_debug.c Maarten Lankhorst 2014=
-07-01  140  =


:::::: The code at line 134 was first introduced by commit
:::::: a02b9dc90d844cc7df7b63264e7920cc425052d9 dma-buf/sync_file: refactor=
 fence storage in struct sync_file

:::::: TO: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2274913778703460865==--

