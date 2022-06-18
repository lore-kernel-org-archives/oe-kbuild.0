Content-Type: multipart/mixed; boundary="===============8152531055123564272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 6/7] include/linux/bitops.h:52:11: warning: dereference of NULL 'dev' [CWE-476]
Date: Sat, 18 Jun 2022 13:44:24 +0800
Message-ID: <202206181307.LXgoJOJZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8152531055123564272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/bitops.h:52:11: warning: dereference of NULL 'dev' [CWE-476] [-Wanalyz=
er-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: a8846f7b2f123f210694db27803e17fae1c15cbe [6/7] bitops: let optimize=
 out non-atomic bitops on compile-time constants
:::::: branch date: 16 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-c001 (https://download.01.org/0day-ci/archive/202=
20618/202206181307.LXgoJOJZ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/a8846f7b2f123f210694db27=
803e17fae1c15cbe
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout a8846f7b2f123f210694db27803e17fae1c15cbe
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/log2.h:12,
                    from include/asm-generic/getorder.h:8,
                    from arch/x86/include/asm/page.h:87,
                    from arch/x86/include/asm/io.h:44,
                    from drivers/input/joydev.c:11:
   drivers/input/joydev.c: In function 'joydev_connect':
>> include/linux/bitops.h:52:11: warning: dereference of NULL 'dev' [CWE-47=
6] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   drivers/input/joydev.c:955:21: note: in expansion of macro 'test_bit'
     955 |                 if (test_bit(i + BTN_MISC, dev->keybit)) {
         |                     ^~~~~~~~
     'joydev_connect': events 1-6
       |
       |  911 | static int joydev_connect(struct input_handler *handler, st=
ruct input_dev *dev,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'joydev_connect'
       |......
       |  919 |         if (minor < 0) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'minor >=3D 0=
')...
       |......
       |  925 |         joydev =3D kzalloc(sizeof(struct joydev), GFP_KERNE=
L);
       |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       |  926 |         if (!joydev) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'joydev' is n=
on-NULL)...
       |......
       |  931 |         INIT_LIST_HEAD(&joydev->client_list);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (5) ...to here
       |......
       |  943 |         joydev->handle.dev =3D input_get_device(dev);
       |      |                              ~~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (6) calling 'input_get_device'=
 from 'joydev_connect'
       |
       +--> 'input_get_device': event 7
              |
              |include/linux/input.h:363:33:
              |  363 | static inline struct input_dev *input_get_device(str=
uct input_dev *dev)
              |      |                                 ^~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (7) entry to 'input_=
get_device'
              |
            'input_get_device': event 8
              |
              |  365 |         return dev ? to_input_dev(get_device(&dev->d=
ev)) : NULL;
              |
            'input_get_device': event 9
              |
              |  365 |         return dev ? to_input_dev(get_device(&dev->d=
ev)) : NULL;
              |
       <------+
       |
     'joydev_connect': events 10-11
       |
       |drivers/input/joydev.c:943:30:
       |  943 |         joydev->handle.dev =3D input_get_device(dev);
       |      |                              ^~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (10) returning to 'joydev_conn=
ect' from 'input_get_device'
       |......
       |  954 |         for (i =3D BTN_JOYSTICK - BTN_MISC; i < KEY_MAX - B=
TN_MISC + 1; i++)
       |      |                                           ~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                                             |
       |      |                                             (11) following =
'true' branch (when 'i !=3D 512')...
       |
     'joydev_connect': event 12
       |
       |include/linux/bitops.h:49:11:
       |   49 |         ((__builtin_constant_p(nr) &&                      =
             \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |           |
       |      |           (12) ...to here
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   drivers/input/joydev.c:955:21: note: in expansion of macro 'test_bit'
       |  955 |                 if (test_bit(i + BTN_MISC, dev->keybit)) {
       |      |                     ^~~~~~~~
       |
     'joydev_connect': event 13
       |
       |include/linux/bitops.h:49:9:
       |   49 |         ((__builtin_constant_p(nr) &&                      =
             \
       |      |         ^
       |      |         |
       |      |         (13) following 'true' branch...
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   drivers/input/joydev.c:955:21: note: in expansion of macro 'test_bit'
       |  955 |                 if (test_bit(i + BTN_MISC, dev->keybit)) {
       |      |                     ^~~~~~~~
       |
     'joydev_connect': event 14
       |
--
   include/linux/spinlock.h:114:41: note: in expansion of macro 'arch_spin_=
is_locked'
                                                        |  114 | #define ra=
w_spin_is_locked(lock)        arch_spin_is_locked(&(lock)->raw_lock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:20:49: note: in expansion of macro 'raw=
_spin_is_locked'
                                                        |   20 | #define as=
sert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                                        |      |           =
                                      ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
                                                        |  450 | #define as=
sert_spin_locked(lock)        assert_raw_spin_locked(&(lock)->rlock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:123:9: note: in expansion of macro 'assert_spin_locked'
                                                        |  123 |         as=
sert_spin_locked(&inode->i_lock);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~
                                                        |
                                                      'inode_io_list_move_l=
ocked': event 71
                                                        |
                                                        |include/asm-generi=
c/bug.h:71:35:
                                                        |   71 | #define BU=
G_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                        |      |           =
                        ^
                                                        |      |           =
                        |
                                                        |      |           =
                        (71) following 'false' branch...
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
                                                        |   20 | #define as=
sert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                                        |      |           =
                              ^~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
                                                        |  450 | #define as=
sert_spin_locked(lock)        assert_raw_spin_locked(&(lock)->rlock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:123:9: note: in expansion of macro 'assert_spin_locked'
                                                        |  123 |         as=
sert_spin_locked(&inode->i_lock);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~
                                                        |
                                                      'inode_io_list_move_l=
ocked': events 72-75
                                                        |
                                                        |  125 |         li=
st_move(&inode->i_io_list, head);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                        |      |         |
                                                        |      |         (7=
2) ...to here
                                                        |......
                                                        |  128 |         if=
 (head !=3D &wb->b_dirty_time)
                                                        |      |           =
 ~
                                                        |      |           =
 |
                                                        |      |           =
 (73) following 'true' branch...
                                                        |  129 |           =
      return wb_io_lists_populated(wb);
                                                        |      |           =
             ~~~~~~~~~~~~~~~~~~~~~~~~~
                                                        |      |           =
             |
                                                        |      |           =
             (74) ...to here
                                                        |      |           =
             (75) calling 'wb_io_lists_populated' from 'inode_io_list_move_=
locked'
                                                        |
                                                        +--> 'wb_io_lists_p=
opulated': events 76-77
                                                               |
                                                               |   85 | sta=
tic bool wb_io_lists_populated(struct bdi_writeback *wb)
                                                               |      |    =
         ^~~~~~~~~~~~~~~~~~~~~
                                                               |      |    =
         |
                                                               |      |    =
         (76) entry to 'wb_io_lists_populated'
                                                               |   86 | {
                                                               |   87 |    =
     if (wb_has_dirty_io(wb)) {
                                                               |      |    =
         ~~~~~~~~~~~~~~~~~~~
                                                               |      |    =
         |
                                                               |      |    =
         (77) calling 'wb_has_dirty_io' from 'wb_io_lists_populated'
                                                               |
                                                               +--> 'wb_has=
_dirty_io': event 78
                                                                      |
                                                                      |incl=
ude/linux/backing-dev.h:51:20:
                                                                      |   5=
1 | static inline bool wb_has_dirty_io(struct bdi_writeback *wb)
                                                                      |    =
  |                    ^~~~~~~~~~~~~~~
                                                                      |    =
  |                    |
                                                                      |    =
  |                    (78) entry to 'wb_has_dirty_io'
                                                                      |
                                                                    'wb_has=
_dirty_io': event 79
                                                                      |
                                                                      |incl=
ude/linux/bitops.h:53:30:
                                                                      |   4=
9 |         ((__builtin_constant_p(nr) &&                                  =
 \
                                                                      |    =
  |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
                                                                      |   5=
0 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) =
&& \
                                                                      |    =
  |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
                                                                      |   5=
1 |           (uintptr_t)(addr) !=3D (uintptr_t)NULL &&                    =
   \
                                                                      |    =
  |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
                                                                      |   5=
2 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?      =
 \
                                                                      |    =
  |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
                                                                      |   5=
3 |          const##op(nr, addr) : op(nr, addr))
                                                                      |    =
  |          ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
                                                                      |    =
  |                              |
                                                                      |    =
  |                              (79) following 'false' branch...
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
                                                                      |   6=
1 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                                      |    =
  |                                         ^~~~~
   include/linux/backing-dev.h:53:16: note: in expansion of macro 'test_bit'
                                                                      |   5=
3 |         return test_bit(WB_has_dirty_io, &wb->state);
                                                                      |    =
  |                ^~~~~~~~
                                                                      |
                                                                    'wb_has=
_dirty_io': events 80-81
                                                                      |
                                                                      |arch=
/x86/include/asm/bitops.h:207:22:
                                                                      |  20=
7 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
                                                                      |    =
  |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                                      |    =
  |                      |
                                                                      |    =
  |                      (80) ...to here
                                                                      |    =
  |                      (81) dereference of NULL 'wb'
                                                                      |
   In file included from include/linux/kernel.h:22,
                    from fs/fs-writeback.c:17:
>> include/linux/bitops.h:52:11: warning: dereference of NULL 'wb' [CWE-476=
] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   include/linux/backing-dev.h:53:16: note: in expansion of macro 'test_bit'
      53 |         return test_bit(WB_has_dirty_io, &wb->state);
         |                ^~~~~~~~
     'wb_workfn': events 1-2
       |
       |fs/fs-writeback.c:2205:6:
       | 2205 | void wb_workfn(struct work_struct *work)
       |      |      ^~~~~~~~~
       |      |      |
       |      |      (1) entry to 'wb_workfn'
       |......
       | 2213 |         if (likely(!current_is_workqueue_rescuer() ||
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       |
     'wb_workfn': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'wb_workfn': event 4
       |
       | 2222 |                         pages_written =3D wb_do_writeback(w=
b);
       |      |                                         ^~~~~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (4) calling 'wb_do_=
writeback' from 'wb_workfn'
       |
       +--> 'wb_do_writeback': events 5-6
              |
              | 2174 | static long wb_do_writeback(struct bdi_writeback *wb)
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (5) entry to 'wb_do_writeback'
              |......
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (6) calling 'get_next_work_it=
em' from 'wb_do_writeback'
              |
              +--> 'get_next_work_item': events 7-8
                     |
                     | 2081 | static struct wb_writeback_work *get_next_wor=
k_item(struct bdi_writeback *wb)
                     |      |                                  ^~~~~~~~~~~~=
~~~~~~
                     |      |                                  |
                     |      |                                  (7) entry to=
 'get_next_work_item'
                     |......
                     | 2086 |         if (!list_empty(&wb->work_list)) {
                     |      |            ~                      =

                     |      |            |
                     |      |            (8) following 'true' branch...
                     |
                   'get_next_work_item': event 9
                     |
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (9) ...to here
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
                     |  520 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   fs/fs-writeback.c:2087:24: note: in expansion of macro 'list_entry'
                     | 2087 |                 work =3D list_entry(wb->work_=
list.next,
                     |      |                        ^~~~~~~~~~
                     |
              <------+
              |
            'wb_do_writeback': event 10
              |
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (10) returning to 'wb_do_writ=
eback' from 'get_next_work_item'
              |
            'wb_do_writeback': events 11-13
              |
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              | 2181 |                 trace_writeback_exec(wb, work);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  =

              |      |                 |
              |      |                 (12) ...to here
              | 2182 |                 wrote +=3D wb_writeback(wb, work);
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~ =

              |      |                          |
              |      |                          (13) calling 'wb_writeback'=
 from 'wb_do_writeback'
              |
              +--> 'wb_writeback': events 14-18
                     |
                     | 1988 | static long wb_writeback(struct bdi_writeback=
 *wb,
                     |      |             ^~~~~~~~~~~~
                     |      |             |
                     |      |             (14) entry to 'wb_writeback'
                     |......
                     | 2003 |                 if (work->nr_pages <=3D 0)
--
   In file included from include/linux/bitops.h:67,
                    from include/linux/kernel.h:22,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/leds/trigger/ledtrig-netdev.c:15:
   include/linux/netdevice.h: In function 'netif_carrier_ok':
>> arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'dev'=
 [CWE-476] [-Wanalyzer-null-dereference]
     207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
         |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
     'device_name_store': events 1-6
       |
       |drivers/leds/trigger/ledtrig-netdev.c:107:16:
       |  107 | static ssize_t device_name_store(struct device *dev,
       |      |                ^~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'device_name_store'
       |......
       |  113 |         if (size >=3D IFNAMSIZ)
       |      |            ~    =

       |      |            |
       |      |            (2) following 'false' branch (when 'size <=3D 15=
')...
       |......
       |  116 |         cancel_delayed_work_sync(&trigger_data->work);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       |  120 |         if (trigger_data->net_dev) {
       |      |            ~    =

       |      |            |
       |      |            (4) following 'true' branch...
       |  121 |                 dev_put(trigger_data->net_dev);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling 'dev_put' from 'device_name_sto=
re'
       |
       +--> 'dev_put': events 7-8
              |
              |include/linux/netdevice.h:4021:20:
              | 4021 | static inline void dev_put(struct net_device *dev)
              |      |                    ^~~~~~~
              |      |                    |
              |      |                    (7) entry to 'dev_put'
              | 4022 | {
              | 4023 |         dev_put_track(dev, NULL);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (8) calling 'dev_put_track' from 'dev_put'
              |
              +--> 'dev_put_track': events 9-12
                     |
                     | 3993 | static inline void dev_put_track(struct net_d=
evice *dev,
                     |      |                    ^~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (9) entry to 'dev_put_trac=
k'
                     |......
                     | 3996 |         if (dev) {
                     |      |            ~        =

                     |      |            |
                     |      |            (10) following 'true' branch (when=
 'dev' is non-NULL)...
                     | 3997 |                 netdev_tracker_free(dev, trac=
ker);
                     | 3998 |                 __dev_put(dev);
                     |      |                 ~~~~~~~~~~~~~~
                     |      |                 |
                     |      |                 (11) ...to here
                     |      |                 (12) calling '__dev_put' from=
 'dev_put_track'
                     |
                     +--> '__dev_put': events 13-16
                            |
                            | 3933 | static inline void __dev_put(struct ne=
t_device *dev)
                            |      |                    ^~~~~~~~~
                            |      |                    |
                            |      |                    (13) entry to '__de=
v_put'
                            | 3934 | {
                            | 3935 |         if (dev) {
                            |      |            ~        =

                            |      |            |
                            |      |            (14) following 'true' branc=
h (when 'dev' is non-NULL)...
                            |......
                            | 3939 |                 refcount_dec(&dev->dev=
_refcnt);
                            |      |                 ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
                            |      |                 |
                            |      |                 (15) ...to here
                            |      |                 (16) calling 'refcount=
_dec' from '__dev_put'
                            |
                            +--> 'refcount_dec': events 17-18
                                   |
                                   |include/linux/refcount.h:357:20:
                                   |  357 | static inline void refcount_dec=
(refcount_t *r)
                                   |      |                    ^~~~~~~~~~~~
                                   |      |                    |
                                   |      |                    (17) entry t=
o 'refcount_dec'
                                   |  358 | {
                                   |  359 |         __refcount_dec(r, NULL);
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (18) calling '__refcoun=
t_dec' from 'refcount_dec'
                                   |
                                   +--> '__refcount_dec': events 19-20
                                          |
                                          |  336 | static inline void __ref=
count_dec(refcount_t *r, int *oldp)
                                          |      |                    ^~~~~=
~~~~~~~~~
                                          |      |                    |
                                          |      |                    (19) =
entry to '__refcount_dec'
                                          |......
                                          |  340 |         if (oldp)

vim +/dev +52 include/linux/bitops.h

521611f961a7dd Alexander Lobakin 2022-05-09  35  =

a8846f7b2f123f Alexander Lobakin 2022-05-12  36  /*
a8846f7b2f123f Alexander Lobakin 2022-05-12  37   * Many architecture-speci=
fic non-atomic bitops contain inline asm code and due
a8846f7b2f123f Alexander Lobakin 2022-05-12  38   * to that the compiler ca=
n't optimize them to compile-time expressions or
a8846f7b2f123f Alexander Lobakin 2022-05-12  39   * constants. In contrary,=
 gen_*() helpers are defined in pure C and compilers
a8846f7b2f123f Alexander Lobakin 2022-05-12  40   * optimize them just well.
a8846f7b2f123f Alexander Lobakin 2022-05-12  41   * Therefore, to make `uns=
igned long foo =3D 0; __set_bit(BAR, &foo)` effectively
a8846f7b2f123f Alexander Lobakin 2022-05-12  42   * equal to `unsigned long=
 foo =3D BIT(BAR)`, pick the generic C alternative when
a8846f7b2f123f Alexander Lobakin 2022-05-12  43   * the arguments can be re=
solved at compile time. That expression itself is a
a8846f7b2f123f Alexander Lobakin 2022-05-12  44   * constant and doesn't br=
ing any functional changes to the rest of cases.
a8846f7b2f123f Alexander Lobakin 2022-05-12  45   * The casts to `uintptr_t=
` are needed to mitigate `-Waddress` warnings when
a8846f7b2f123f Alexander Lobakin 2022-05-12  46   * passing a bitmap from .=
bss or .data (-> `!!addr` is always true).
a8846f7b2f123f Alexander Lobakin 2022-05-12  47   */
54dcb250626d4e Alexander Lobakin 2022-06-16  48  #define bitop(op, nr, addr=
)						\
a8846f7b2f123f Alexander Lobakin 2022-05-12  49  	((__builtin_constant_p(nr=
) &&					\
a8846f7b2f123f Alexander Lobakin 2022-05-12  50  	  __builtin_constant_p((u=
intptr_t)(addr) !=3D (uintptr_t)NULL) &&	\
a8846f7b2f123f Alexander Lobakin 2022-05-12  51  	  (uintptr_t)(addr) !=3D =
(uintptr_t)NULL &&			\
a8846f7b2f123f Alexander Lobakin 2022-05-12 @52  	  __builtin_constant_p(*(=
const unsigned long *)(addr))) ?	\
a8846f7b2f123f Alexander Lobakin 2022-05-12  53  	 const##op(nr, addr) : op=
(nr, addr))
54dcb250626d4e Alexander Lobakin 2022-06-16  54  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8152531055123564272==--

