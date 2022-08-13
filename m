Content-Type: multipart/mixed; boundary="===============8474471088345718306=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457]
Date: Sat, 13 Aug 2022 08:37:18 +0800
Message-ID: <202208130859.iUqAbbx8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8474471088345718306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '((struct hi=
dma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457] [-Wanalyze=
r-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4a9350597aff50bbd0f4b80ccf49d2e02d1111f5
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220811 (https://download.01.org/0day-ci/archi=
ve/20220813/202208130859.iUqAbbx8-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd2a8ebbf8192b84b11f1b204c4f7c602df32aeac
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d2a8ebbf8192b84b11f1b204c4f7c602df32aeac
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |
              |  459 | static int hidma_terminate_channel(struct dma_chan *=
chan)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'hidma_terminate_channel'
              |......
              |  470 |         hidma_process_completed(mchan);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (4) calling 'hidma_process_completed' from '=
hidma_terminate_channel'
              |
              +--> 'hidma_process_completed': events 5-6
                     |
                     |  108 | static void hidma_process_completed(struct hi=
dma_chan *mchan)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (5) entry to 'hidma_process_compl=
eted'
                     |......
                     |  117 |         struct list_head list;
                     |      |                          ~~~~
                     |      |                          |
                     |      |                          (6) region created o=
n stack here
                     |
                   'hidma_process_completed': event 7
                     |
                     |include/linux/list.h:498:12:
                     |  498 |         if (!list_empty(list)) {
                     |      |            ^
                     |      |            |
                     |      |            (7) following 'false' branch...
                     |
                   'hidma_process_completed': event 8
                     |
                     |include/linux/spinlock.h:293:17:
                     |  293 |                 _raw_spin_unlock_irqrestore(l=
ock, flags);       \
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |                 |
                     |      |                 (8) ...to here
   include/linux/spinlock.h:417:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
                     |  417 |         raw_spin_unlock_irqrestore(&lock->rlo=
ck, flags);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'hidma_process_completed': event 9
                     |
                     |include/linux/list.h:717:14:
                     |  717 |              !list_entry_is_head(pos, head, m=
ember);                    \
                     |      |              ^
                     |      |              |
                     |      |              (9) following 'true' branch...
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
                     |  127 |         list_for_each_entry_safe(mdesc, next,=
 &list, node) {
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'hidma_process_completed': events 10-11
                     |
                     |  129 |                 struct dmaengine_desc_callbac=
k cb;
                     |      |                                              =
  ^~
                     |      |                                              =
  |
                     |      |                                              =
  (10) ...to here
                     |......
                     |  145 |                 dma_cookie_complete(desc);
                     |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~    =
   =

                     |      |                 |
                     |      |                 (11) calling 'dma_cookie_comp=
lete' from 'hidma_process_completed'
                     |
                     +--> 'dma_cookie_complete': event 12
                            |
                            |drivers/dma/qcom/../dmaengine.h:52:20:
                            |   52 | static inline void dma_cookie_complete=
(struct dma_async_tx_descriptor *tx)
                            |      |                    ^~~~~~~~~~~~~~~~~~~
                            |      |                    |
                            |      |                    (12) entry to 'dma_=
cookie_complete'
                            |
                          'dma_cookie_complete': event 13
                            |
                            |include/asm-generic/bug.h:65:35:
                            |   65 | #define BUG_ON(condition) do { if (unl=
ikely(condition)) BUG(); } while (0)
                            |      |                                   ^
                            |      |                                   |
                            |      |                                   (13)=
 following 'false' branch...
   drivers/dma/qcom/../dmaengine.h:54:9: note: in expansion of macro 'BUG_O=
N'
                            |   54 |         BUG_ON(tx->cookie < DMA_MIN_CO=
OKIE);
                            |      |         ^~~~~~
                            |
                          'dma_cookie_complete': events 14-15
                            |
                            |   55 |         tx->chan->completed_cookie =3D=
 tx->cookie;
                            |      |         ~~^~~~~~
                            |      |           |
                            |      |           (14) ...to here
                            |      |           (15) use of uninitialized va=
lue '*tx.chan' here
                            |
   In file included from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16:
   drivers/dma/qcom/hidma.c: In function 'hidma_process_completed':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
     716 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
     127 |         list_for_each_entry_safe(mdesc, next, &list, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'hidma_process_completed': event 1
       |
       |  117 |         struct list_head list;
       |      |                          ^~~~
       |      |                          |
       |      |                          (1) region created on stack here
       |
     'hidma_process_completed': event 2
       |
       |include/linux/list.h:498:12:
       |  498 |         if (!list_empty(list)) {
       |      |            ^
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'hidma_process_completed': event 3
       |
       |include/linux/spinlock.h:293:17:
       |  293 |                 _raw_spin_unlock_irqrestore(lock, flags);  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
   include/linux/spinlock.h:417:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
       |  417 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'hidma_process_completed': event 4
       |
       |include/linux/container_of.h:18:15:
       |   18 |         void *__mptr =3D (void *)(ptr);                    =
               \
       |      |               ^~~~~~
       |      |               |
       |      |               (4) use of uninitialized value '((struct hidm=
a_desc *)((char *)__mptr + 28))[71582787].node.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
       |  511 |         container_of(ptr, type, member)
       |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
       |  555 |         list_entry((pos)->member.next, typeof(*(pos)), memb=
er)
       |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
       |  716 |                 n =3D list_next_entry(pos, member);        =
               \
       |      |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
       |  127 |         list_for_each_entry_safe(mdesc, next, &list, node) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
     716 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
     127 |         list_for_each_entry_safe(mdesc, next, &list, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'hidma_terminate_channel': events 1-2
       |
       |  459 | static int hidma_terminate_channel(struct dma_chan *chan)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'hidma_terminate_channel'
       |......
       |  470 |         hidma_process_completed(mchan);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'hidma_process_completed' from 'hidma_t=
erminate_channel'
       |
       +--> 'hidma_process_completed': events 3-4
              |
              |  108 | static void hidma_process_completed(struct hidma_cha=
n *mchan)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'hidma_process_completed'
              |......
              |  117 |         struct list_head list;
              |      |                          ~~~~
              |      |                          |
              |      |                          (4) region created on stack=
 here
              |
            'hidma_process_completed': event 5
              |
              |include/linux/list.h:498:12:
              |  498 |         if (!list_empty(list)) {
              |      |            ^
              |      |            |
              |      |            (5) following 'false' branch...
              |
            'hidma_process_completed': event 6
              |
              |include/linux/spinlock.h:293:17:
              |  293 |                 _raw_spin_unlock_irqrestore(lock, fl=
ags);       \
              |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
              |      |                 |
              |      |                 (6) ...to here
   include/linux/spinlock.h:417:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
              |  417 |         raw_spin_unlock_irqrestore(&lock->rlock, fla=
gs);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'hidma_process_completed': event 7
              |
              |include/linux/container_of.h:18:15:
              |   18 |         void *__mptr =3D (void *)(ptr);             =
                      \
              |      |               ^~~~~~
              |      |               |
              |      |               (7) use of uninitialized value '((stru=
ct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
              |  511 |         container_of(ptr, type, member)
              |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
              |  555 |         list_entry((pos)->member.next, typeof(*(pos)=
), member)
              |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
              |  716 |                 n =3D list_next_entry(pos, member); =
                      \
              |      |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
              |  127 |         list_for_each_entry_safe(mdesc, next, &list,=
 node) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
              |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
     716 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
     127 |         list_for_each_entry_safe(mdesc, next, &list, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'hidma_callback': events 1-2
       |
       |  165 | static void hidma_callback(void *data)
       |      |             ^~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'hidma_callback'
       |......
       |  186 |         hidma_process_completed(mchan);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'hidma_process_completed' from 'hidma_c=
allback'
       |
       +--> 'hidma_process_completed': events 3-4
              |
              |  108 | static void hidma_process_completed(struct hidma_cha=
n *mchan)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'hidma_process_completed'
              |......
              |  117 |         struct list_head list;
              |      |                          ~~~~
              |      |                          |
              |      |                          (4) region created on stack=
 here
              |
            'hidma_process_completed': event 5
              |
              |include/linux/list.h:498:12:
              |  498 |         if (!list_empty(list)) {
              |      |            ^
              |      |            |
              |      |            (5) following 'false' branch...
              |
            'hidma_process_completed': event 6
              |
              |include/linux/spinlock.h:293:17:
              |  293 |                 _raw_spin_unlock_irqrestore(lock, fl=
ags);       \
              |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
              |      |                 |
              |      |                 (6) ...to here
   include/linux/spinlock.h:417:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
              |  417 |         raw_spin_unlock_irqrestore(&lock->rlock, fla=
gs);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'hidma_process_completed': event 7
              |
              |include/linux/container_of.h:18:15:
              |   18 |         void *__mptr =3D (void *)(ptr);             =
                      \
              |      |               ^~~~~~
              |      |               |
              |      |               (7) use of uninitialized value '((stru=
ct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
              |  511 |         container_of(ptr, type, member)
              |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
              |  555 |         list_entry((pos)->member.next, typeof(*(pos)=
), member)
              |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
              |  716 |                 n =3D list_next_entry(pos, member); =
                      \
              |      |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
              |  127 |         list_for_each_entry_safe(mdesc, next, &list,=
 node) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
              |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
     716 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
     127 |         list_for_each_entry_safe(mdesc, next, &list, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'hidma_free_chan_resources': events 1-2
       |
       |  524 | static void hidma_free_chan_resources(struct dma_chan *dmac=
h)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'hidma_free_chan_resources'
       |......
       |  533 |         hidma_terminate_channel(dmach);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'hidma_terminate_channel' from 'hidma_f=
ree_chan_resources'
       |
       +--> 'hidma_terminate_channel': events 3-4
              |
              |  459 | static int hidma_terminate_channel(struct dma_chan *=
chan)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'hidma_terminate_channel'
              |......
              |  470 |         hidma_process_completed(mchan);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (4) calling 'hidma_process_completed' from '=
hidma_terminate_channel'
              |
              +--> 'hidma_process_completed': events 5-6
                     |
                     |  108 | static void hidma_process_completed(struct hi=
dma_chan *mchan)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (5) entry to 'hidma_process_compl=
eted'
                     |......
                     |  117 |         struct list_head list;
                     |      |                          ~~~~
                     |      |                          |
                     |      |                          (6) region created o=
n stack here
                     |
                   'hidma_process_completed': event 7
                     |
                     |include/linux/list.h:498:12:
                     |  498 |         if (!list_empty(list)) {
                     |      |            ^
                     |      |            |
                     |      |            (7) following 'false' branch...
                     |
                   'hidma_process_completed': event 8
                     |
                     |include/linux/spinlock.h:293:17:
                     |  293 |                 _raw_spin_unlock_irqrestore(l=
ock, flags);       \
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |                 |
                     |      |                 (8) ...to here
   include/linux/spinlock.h:417:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
                     |  417 |         raw_spin_unlock_irqrestore(&lock->rlo=
ck, flags);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'hidma_process_completed': event 9
                     |
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (9) use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
                     |  511 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
                     |  555 |         list_entry((pos)->member.next, typeof=
(*(pos)), member)
                     |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
                     |  716 |                 n =3D list_next_entry(pos, me=
mber);                       \
                     |      |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
                     |  127 |         list_for_each_entry_safe(mdesc, next,=
 &list, node) {
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
     716 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
     127 |         list_for_each_entry_safe(mdesc, next, &list, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'hidma_terminate_all': events 1-2
       |
       |  506 | static int hidma_terminate_all(struct dma_chan *chan)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'hidma_terminate_all'
       |......
       |  512 |         rc =3D hidma_terminate_channel(chan);
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (2) calling 'hidma_terminate_channel' from 'hi=
dma_terminate_all'
       |
       +--> 'hidma_terminate_channel': events 3-4
              |
              |  459 | static int hidma_terminate_channel(struct dma_chan *=
chan)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'hidma_terminate_channel'
              |......
              |  470 |         hidma_process_completed(mchan);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (4) calling 'hidma_process_completed' from '=
hidma_terminate_channel'
              |
              +--> 'hidma_process_completed': events 5-6
                     |
                     |  108 | static void hidma_process_completed(struct hi=
dma_chan *mchan)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (5) entry to 'hidma_process_compl=
eted'
                     |......
                     |  117 |         struct list_head list;
                     |      |                          ~~~~
                     |      |                          |
                     |      |                          (6) region created o=
n stack here
                     |
                   'hidma_process_completed': event 7
                     |
                     |include/linux/list.h:498:12:
                     |  498 |         if (!list_empty(list)) {
                     |      |            ^
                     |      |            |
                     |      |            (7) following 'false' branch...
                     |
                   'hidma_process_completed': event 8
                     |
                     |include/linux/spinlock.h:293:17:
                     |  293 |                 _raw_spin_unlock_irqrestore(l=
ock, flags);       \
                     |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |                 |
                     |      |                 (8) ...to here
   include/linux/spinlock.h:417:9: note: in expansion of macro 'raw_spin_un=
lock_irqrestore'
                     |  417 |         raw_spin_unlock_irqrestore(&lock->rlo=
ck, flags);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'hidma_process_completed': event 9
                     |
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (9) use of uninitialized value =
'((struct hidma_desc *)((char *)__mptr + 28))[71582787].node.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
                     |  511 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
                     |  555 |         list_entry((pos)->member.next, typeof=
(*(pos)), member)
                     |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
                     |  716 |                 n =3D list_next_entry(pos, me=
mber);                       \
                     |      |                     ^~~~~~~~~~~~~~~
   drivers/dma/qcom/hidma.c:127:9: note: in expansion of macro 'list_for_ea=
ch_entry_safe'
                     |  127 |         list_for_each_entry_safe(mdesc, next,=
 &list, node) {
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
   drivers/dma/qcom/hidma.c:133:29: warning: use of uninitialized value '*(=
struct dma_async_tx_descriptor *)mdesc.cookie' [CWE-457] [-Wanalyzer-use-of=
-uninitialized-value]
     133 |                 last_cookie =3D desc->cookie;
         |                 ~~~~~~~~~~~~^~~~~~~~~~~~~~
     'hidma_process_completed': event 1
       |
       |  117 |         struct list_head list;
       |      |                          ^~~~
       |      |                          |
       |      |                          (1) region created on stack here
       |
     'hidma_process_completed': event 2

vim +18 include/linux/container_of.h

d2a8ebbf8192b84 Andy Shevchenko 2021-11-08   9  =

d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  10  /**
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  11   * container_of - cast a me=
mber of a structure out to the containing structure
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  12   * @ptr:	the pointer to the=
 member.
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  13   * @type:	the type of the c=
ontainer struct this is embedded in.
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  14   * @member:	the name of the=
 member within the struct.
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  15   *
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  16   */
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  17  #define container_of(ptr, t=
ype, member) ({				\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08 @18  	void *__mptr =3D (void *)(=
ptr);					\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  19  	BUILD_BUG_ON_MSG(!__same_t=
ype(*(ptr), ((type *)0)->member) &&	\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  20  			 !__same_type(*(ptr), vo=
id),			\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  21  			 "pointer type mismatch =
in container_of()");	\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  22  	((type *)(__mptr - offseto=
f(type, member))); })
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  23  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8474471088345718306==--

