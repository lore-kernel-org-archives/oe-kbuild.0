Content-Type: multipart/mixed; boundary="===============4393248219342656006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '*scmd.eh_entry.next' [CWE-457]
Date: Sun, 18 Sep 2022 21:25:43 +0800
Message-ID: <202209182135.25NPUkZv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4393248219342656006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '*scmd.eh_en=
try.next' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220918/202209182135.25NPUkZv-lkp(a)intel.com/config)
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

gcc_analyzer warnings: (new ones prefixed by >>)
              |      |              (14) calling 'scsi_eh_get_sense' from '=
scsi_unjam_host'
              |
              +--> 'scsi_eh_get_sense': event 15
                     |
                     | 1231 | int scsi_eh_get_sense(struct list_head *work_=
q,
                     |      |     ^~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (15) entry to 'scsi_eh_get_sense'
                     |
                   'scsi_eh_get_sense': event 16
                     |
                     |include/linux/list.h:717:14:
                     |  717 |              !list_entry_is_head(pos, head, m=
ember);                    \
                     |      |              ^
                     |      |              |
                     |      |              (16) following 'true' branch...
   drivers/scsi/scsi_error.c:1242:9: note: in expansion of macro 'list_for_=
each_entry_safe'
                     | 1242 |         list_for_each_entry_safe(scmd, next, =
work_q, eh_entry) {
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'scsi_eh_get_sense': events 17-18
                     |
                     | 1243 |                 if ((scmd->eh_eflags & SCSI_E=
H_ABORT_SCHEDULED) ||
                     |      |                    ~ ~~~~^~~~~~~~~~~
                     |      |                    |     |
                     |      |                    |     (17) ...to here
                     |      |                    (18) following 'false' bra=
nch...
                     |
                   'scsi_eh_get_sense': event 19
                     |
                     |drivers/scsi/scsi_priv.h:28:17:
                     |   28 |         (((scmd)->sense_buffer[0] & 0x70) =3D=
=3D 0x70)
                     |      |           ~~~~~~^~~~~~~~~~~~~~
                     |      |                 |
                     |      |                 (19) ...to here
   drivers/scsi/scsi_error.c:1244:21: note: in expansion of macro 'SCSI_SEN=
SE_VALID'
                     | 1244 |                     SCSI_SENSE_VALID(scmd))
                     |      |                     ^~~~~~~~~~~~~~~~
                     |
                   'scsi_eh_get_sense': events 20-22
                     |
                     | 1243 |                 if ((scmd->eh_eflags & SCSI_E=
H_ABORT_SCHEDULED) ||
                     |......
                     | 1247 |                 shost =3D scmd->device->host;
                     |      |                         ~~~~~~~~~~~~         =
                    =

                     |      |                             |
                     |      |                             (21) ...to here
                     | 1248 |                 if (scsi_host_eh_past_deadlin=
e(shost)) {
                     |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~            =

                     |      |                     |
                     |      |                     (22) calling 'scsi_host_e=
h_past_deadline' from 'scsi_eh_get_sense'
                     |
                     +--> 'scsi_host_eh_past_deadline': events 23-24
                            |
                            |  100 | static int scsi_host_eh_past_deadline(=
struct Scsi_Host *shost)
                            |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |            |
                            |      |            (23) entry to 'scsi_host_eh=
_past_deadline'
                            |  101 | {
                            |  102 |         if (!shost->last_reset || shos=
t->eh_deadline =3D=3D -1)
                            |      |            ~
                            |      |            |
                            |      |            (24) following 'false' bran=
ch...
                            |
                          'scsi_host_eh_past_deadline': event 25
                            |
                            |include/linux/typecheck.h:11:19:
                            |   11 |         typeof(x) __dummy2; \
                            |      |                   ^~~~~~~~
                            |      |                   |
                            |      |                   (25) ...to here
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
                            |  106 |          typecheck(unsigned long, b) &=
& \
                            |      |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
                            |  108 | #define time_before(a,b)        time_a=
fter(b,a)
                            |      |                                 ^~~~~~=
~~~~
   drivers/scsi/scsi_error.c:112:13: note: in expansion of macro 'time_befo=
re'
                            |  112 |         if (time_before(jiffies, shost=
->last_reset + shost->eh_deadline) &&
                            |      |             ^~~~~~~~~~~
                            |
                          'scsi_host_eh_past_deadline': event 26
                            |
                            |include/linux/typecheck.h:11:19:
                            |   11 |         typeof(x) __dummy2; \
                            |      |                   ^~~~~~~~
                            |      |                   |
                            |      |                   (26) use of uninitia=
lized value '<unknown>' here
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
                            |  106 |          typecheck(unsigned long, b) &=
& \
                            |      |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
                            |  108 | #define time_before(a,b)        time_a=
fter(b,a)
                            |      |                                 ^~~~~~=
~~~~
   drivers/scsi/scsi_error.c:112:13: note: in expansion of macro 'time_befo=
re'
                            |  112 |         if (time_before(jiffies, shost=
->last_reset + shost->eh_deadline) &&
                            |      |             ^~~~~~~~~~~
                            |
   In file included from include/linux/kernel.h:12:
   drivers/scsi/scsi_error.c: In function 'scsi_eh_prt_fail_stats':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'*scmd.eh_entry.next' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:630:20: note: in expansion of macro 'list_next_entr=
y'
     630 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/scsi/scsi_error.c:383:17: note: in expansion of macro 'list_for_=
each_entry'
     383 |                 list_for_each_entry(scmd, work_q, eh_entry) {
         |                 ^~~~~~~~~~~~~~~~~~~
     'scsi_error_handler': events 1-3
       |
       | 2194 | int scsi_error_handler(void *data)
       |      |     ^~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'scsi_error_handler'
       |......
       | 2212 |                 if (kthread_should_stop())
       |      |                    ~
       |      |                    |
       |      |                    (2) following 'false' branch...
       |......
       | 2215 |                 if ((shost->host_failed =3D=3D 0 && shost->=
host_eh_scheduled =3D=3D 0) ||
       |      |                      ~~~~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (3) ...to here
       |
     'scsi_error_handler': event 4
       |
       |drivers/scsi/scsi_logging.h:49:12:
       |   49 |         if (unlikely((SCSI_LOG_LEVEL(SHIFT, BITS)) > (LEVEL=
)))  \
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch...
   drivers/scsi/scsi_logging.h:65:9: note: in expansion of macro 'SCSI_CHEC=
K_LOGGING'
       |   65 |         SCSI_CHECK_LOGGING(SCSI_LOG_ERROR_SHIFT, SCSI_LOG_E=
RROR_BITS, LEVEL,CMD);
       |      |         ^~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_error.c:2226:17: note: in expansion of macro 'SCSI_LOG=
_ERROR_RECOVERY'
       | 2226 |                 SCSI_LOG_ERROR_RECOVERY(1,
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~
       |
     'scsi_error_handler': events 5-8
       |
       | 2246 |                 if (shost->transportt->eh_strategy_handler)
       |      |                    ~~~~~~^~~~~~~~~~~~
       |      |                    |     |
       |      |                    |     (5) ...to here
       |      |                    (6) following 'false' branch...
       |......
       | 2249 |                         scsi_unjam_host(shost);
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (7) ...to here
       |      |                         (8) calling 'scsi_unjam_host' from =
'scsi_error_handler'
       |
       +--> 'scsi_unjam_host': event 9
              |
              | 2164 | static void scsi_unjam_host(struct Scsi_Host *shost)
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (9) entry to 'scsi_unjam_host'
              |
            'scsi_unjam_host': event 10
              |
              | 2167 |         LIST_HEAD(eh_work_q);
              |      |                   ^~~~~~~~~
              |      |                   |
              |      |                   (10) region created on stack here
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
              |   24 |         struct list_head name =3D LIST_HEAD_INIT(nam=
e)
              |      |                          ^~~~
              |
            'scsi_unjam_host': event 11
              |
              |  481 |         if (!list_empty(list)) {
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch...
              |
            'scsi_unjam_host': event 12
              |
              |drivers/scsi/scsi_error.c:2172:9:
              | 2172 |         spin_unlock_irqrestore(shost->host_lock, fla=
gs);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
              |      |         |
              |      |         (12) ...to here
              |
            'scsi_unjam_host': event 13
              |
              |drivers/scsi/scsi_logging.h:49:12:
              |   49 |         if (unlikely((SCSI_LOG_LEVEL(SHIFT, BITS)) >=
 (LEVEL)))  \
              |      |            ^
              |      |            |
              |      |            (13) following 'true' branch...
   drivers/scsi/scsi_logging.h:65:9: note: in expansion of macro 'SCSI_CHEC=
K_LOGGING'
              |   65 |         SCSI_CHECK_LOGGING(SCSI_LOG_ERROR_SHIFT, SCS=
I_LOG_ERROR_BITS, LEVEL,CMD);

vim +18 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko 2021-11-08   9  =

d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  11   * container_of - cast a mem=
ber of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  12   * @ptr:	the pointer to the =
member.
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  13   * @type:	the type of the co=
ntainer struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  14   * @member:	the name of the =
member within the struct.
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  15   *
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  16   */
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  17  #define container_of(ptr, ty=
pe, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08 @18  	void *__mptr =3D (void *)(p=
tr);					\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  19  	BUILD_BUG_ON_MSG(!__same_ty=
pe(*(ptr), ((type *)0)->member) &&	\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  20  			 !__same_type(*(ptr), voi=
d),			\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  21  			 "pointer type mismatch i=
n container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  22  	((type *)(__mptr - offsetof=
(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  23  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4393248219342656006==--

