Content-Type: multipart/mixed; boundary="===============6590061194878900614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:20:45: warning: use of uninitialized value '*(unsigned char *)(&stat_buf[31])' [CWE-457]
Date: Sat, 06 Aug 2022 13:15:42 +0800
Message-ID: <202208061306.V3xJHvQj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6590061194878900614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/fortify-string.h:20:45: warning: use of uninitialized value '*(unsigne=
d char *)(&stat_buf[31])' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 3009f891bb9f328945ebd5b71e12df7e2467f3dd fortify: Allow strlen() an=
d strnlen() to pass compile-time known lengths
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220806/202208061306.V3xJHvQj-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3009f891bb9f328945ebd5b71e12df7e2467f3dd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3009f891bb9f328945ebd5b71e12df7e2467f3dd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
                            |
                            +--> 'uart_port_ref': event 33
                                   |
                                   |   58 | static inline struct uart_port =
*uart_port_ref(struct uart_state *state)
                                   |      |                                =
 ^~~~~~~~~~~~~
                                   |      |                                =
 |
                                   |      |                                =
 (33) entry to 'uart_port_ref'
                                   |
                                 'uart_port_ref': event 34
                                   |
                                   |include/linux/atomic/atomic-arch-fallba=
ck.h:1161:20:
                                   | 1161 |                 if (unlikely(c =
=3D=3D u))
                                   |      |                    ^
                                   |      |                    |
                                   |      |                    (34) followi=
ng 'false' branch...
                                   |
                                 'uart_port_ref': event 35
                                   |
                                   |  995 | #define arch_atomic_try_cmpxchg=
 arch_atomic_try_cmpxchg
                                   |      |                                =
 ^
                                   |      |                                =
 |
                                   |      |                                =
 (35) ...to here
   include/linux/atomic/atomic-arch-fallback.h:1163:19: note: in expansion =
of macro 'arch_atomic_try_cmpxchg'
                                   | 1163 |         } while (!arch_atomic_t=
ry_cmpxchg(v, &c, c + a));
                                   |      |                   ^~~~~~~~~~~~~=
~~~~~~~~~~
                                   |
                            <------+
                            |
                          'uart_port_startup': event 36
                            |
                            |drivers/tty/serial/serial_core.c:73:45:
                            |   73 |                 struct uart_port *__up=
ort =3D uart_port_ref(state);       \
                            |      |                                       =
      ^~~~~~~~~~~~~~~~~~~~
                            |      |                                       =
      |
                            |      |                                       =
      (36) returning to 'uart_port_startup' from 'uart_port_ref'
   drivers/tty/serial/serial_core.c:207:9: note: in expansion of macro 'uar=
t_port_lock'
                            |  207 |         uart_port_lock(state, flags);
                            |      |         ^~~~~~~~~~~~~~
                            |
                          'uart_port_startup': event 37
                            |
                            |   74 |                 if (__uport)          =
                                  \
                            |      |                    ^
                            |      |                    |
                            |      |                    (37) following 'fal=
se' branch (when '__uport' is NULL)...
   drivers/tty/serial/serial_core.c:207:9: note: in expansion of macro 'uar=
t_port_lock'
                            |  207 |         uart_port_lock(state, flags);
                            |      |         ^~~~~~~~~~~~~~
                            |
                          'uart_port_startup': events 38-39
                            |
                            |  208 |         if (!state->xmit.buf) {
                            |      |            ~ ~~~~~~~~~~~^~~~
                            |      |            |            |
                            |      |            |            (38) ...to here
                            |      |            (39) following 'false' bran=
ch...
                            |
                          'uart_port_startup': event 40
                            |
                            |   82 |                 if (__uport) {        =
                                  \
                            |      |                    ^
                            |      |                    |
                            |      |                    (40) ...to here
   drivers/tty/serial/serial_core.c:213:17: note: in expansion of macro 'ua=
rt_port_unlock'
                            |  213 |                 uart_port_unlock(uport=
, flags);
                            |      |                 ^~~~~~~~~~~~~~~~
                            |
                          'uart_port_startup': event 41
                            |
                            |   82 |                 if (__uport) {        =
                                  \
                            |      |                    ^
                            |      |                    |
                            |      |                    (41) following 'tru=
e' branch...
   drivers/tty/serial/serial_core.c:213:17: note: in expansion of macro 'ua=
rt_port_unlock'
                            |  213 |                 uart_port_unlock(uport=
, flags);
                            |      |                 ^~~~~~~~~~~~~~~~
                            |
                          'uart_port_startup': events 42-43
                            |
                            |arch/arm/include/asm/irqflags.h:159:9:
                            |  159 |         asm volatile(
                            |      |         ^~~
                            |      |         |
                            |      |         (42) ...to here
                            |......
                            |  171 |         asm volatile(
                            |      |         ~~~
                            |      |         |
                            |      |         (43) use of uninitialized valu=
e 'flags' here
                            |
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:10,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14:
   In function 'strnlen',
       inlined from 'strlen' at include/linux/fortify-string.h:103:8,
       inlined from 'uart_line_info' at drivers/tty/serial/serial_core.c:18=
60:3:
>> include/linux/fortify-string.h:20:45: warning: use of uninitialized valu=
e '*(unsigned char *)(&stat_buf[31])' [CWE-457] [-Wanalyzer-use-of-uninitia=
lized-value]
      20 |                 if (__builtin_constant_p(__p[p_len]) && \
         |                                          ~~~^~~~~~~
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
      77 |         size_t p_len =3D __compiletime_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~~
     'uart_line_info': events 1-7
       |
       |drivers/tty/serial/serial_core.c:1804:14:
       | 1804 |         char stat_buf[32];
       |      |              ^~~~~~~~
       |      |              |
       |      |              (1) region created on stack here
       |......
       | 1810 |         if (!uport)
       |      |            ~  =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1813 |         mmio =3D uport->iotype >=3D UPIO_MEM;
       |      |                ~~~~~~~~~~~~~
       |      |                     |
       |      |                     (3) ...to here
       |......
       | 1821 |         if (uport->type =3D=3D PORT_UNKNOWN) {
       |      |            ~  =

       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1826 |         if (capable(CAP_SYS_ADMIN)) {
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~
       |      |            ||
       |      |            |(5) ...to here
       |      |            (6) following 'true' branch...
       | 1827 |                 pm_state =3D state->pm_state;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (7) ...to here
       |
     'uart_line_info': event 8
       |
       | 1850 |         if (uport->mctrl & (bit)) \
       |      |            ^
       |      |            |
       |      |            (8) following 'true' branch...
   drivers/tty/serial/serial_core.c:1860:17: note: in expansion of macro 'I=
NFOBIT'
       | 1860 |                 INFOBIT(TIOCM_RTS, "|RTS");
       |      |                 ^~~~~~~
       |
     'uart_line_info': event 9
       |
       |include/linux/fortify-string.h:20:45:
       |   20 |                 if (__builtin_constant_p(__p[p_len]) && \
       |      |                                          ~~~^~~~~~~
       |      |                                             |
       |      |                                             (9) ...to here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
       |   77 |         size_t p_len =3D __compiletime_strlen(p);
       |      |                        ^~~~~~~~~~~~~~~~~~~~
       |
     'uart_line_info': event 10
       |
       |   20 |                 if (__builtin_constant_p(__p[p_len]) && \
       |      |                                          ~~~^~~~~~~
       |      |                                             |
       |      |                                             (10) use of uni=
nitialized value '*(unsigned char *)(&stat_buf[31])' here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
       |   77 |         size_t p_len =3D __compiletime_strlen(p);
       |      |                        ^~~~~~~~~~~~~~~~~~~~
       |
   In function 'strnlen',
       inlined from 'strlen' at include/linux/fortify-string.h:103:8,
       inlined from 'strncat' at include/linux/fortify-string.h:192:10,
       inlined from 'uart_line_info' at drivers/tty/serial/serial_core.c:18=
60:3:
>> include/linux/fortify-string.h:20:45: warning: use of uninitialized valu=
e '*(unsigned char *)(&stat_buf[31])' [CWE-457] [-Wanalyzer-use-of-uninitia=
lized-value]
      20 |                 if (__builtin_constant_p(__p[p_len]) && \
         |                                          ~~~^~~~~~~
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
      77 |         size_t p_len =3D __compiletime_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~~
     'uart_line_info': events 1-7
       |
       |drivers/tty/serial/serial_core.c:1804:14:
       | 1804 |         char stat_buf[32];
       |      |              ^~~~~~~~
       |      |              |
       |      |              (1) region created on stack here
       |......
       | 1810 |         if (!uport)
       |      |            ~  =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1813 |         mmio =3D uport->iotype >=3D UPIO_MEM;
       |      |                ~~~~~~~~~~~~~
       |      |                     |
       |      |                     (3) ...to here
       |......
       | 1821 |         if (uport->type =3D=3D PORT_UNKNOWN) {
       |      |            ~  =

       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1826 |         if (capable(CAP_SYS_ADMIN)) {
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~
       |      |            ||
       |      |            |(5) ...to here
       |      |            (6) following 'true' branch...
       | 1827 |                 pm_state =3D state->pm_state;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (7) ...to here
       |
     'uart_line_info': event 8
       |
       | 1850 |         if (uport->mctrl & (bit)) \
       |      |            ^
       |      |            |
       |      |            (8) following 'true' branch...
   drivers/tty/serial/serial_core.c:1860:17: note: in expansion of macro 'I=
NFOBIT'
       | 1860 |                 INFOBIT(TIOCM_RTS, "|RTS");
       |      |                 ^~~~~~~
       |
     'uart_line_info': event 9
       |
       |include/linux/fortify-string.h:20:45:
       |   20 |                 if (__builtin_constant_p(__p[p_len]) && \
       |      |                                          ~~~^~~~~~~
       |      |                                             |
       |      |                                             (9) ...to here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
       |   77 |         size_t p_len =3D __compiletime_strlen(p);
       |      |                        ^~~~~~~~~~~~~~~~~~~~
       |
     'uart_line_info': events 10-12
       |
       |   89 |         if (p_size <=3D ret && maxlen !=3D ret)
       |      |            ^
       |      |            |
       |      |            (10) following 'false' branch...
       |......
       |  104 |         if (p_size <=3D ret)
       |      |            ~
       |      |            |
       |      |            (11) ...to here
       |      |            (12) following 'false' branch...
       |
     'uart_line_info': event 13
       |
       |drivers/tty/serial/serial_core.c:1851:17:
       | 1851 |                 strncat(stat_buf, (str), sizeof(stat_buf) -=
 \
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                 |
       |      |                 (13) ...to here
       | 1852 |                         strlen(stat_buf) - 2)
       |      |                         ~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:1860:17: note: in expansion of macro 'I=
NFOBIT'
       | 1860 |                 INFOBIT(TIOCM_RTS, "|RTS");
       |      |                 ^~~~~~~
       |
     'uart_line_info': event 14
       |
       |include/linux/fortify-string.h:20:45:
       |   20 |                 if (__builtin_constant_p(__p[p_len]) && \
       |      |                                          ~~~^~~~~~~
       |      |                                             |
       |      |                                             (14) use of uni=
nitialized value '*(unsigned char *)(&stat_buf[31])' here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
       |   77 |         size_t p_len =3D __compiletime_strlen(p);
       |      |                        ^~~~~~~~~~~~~~~~~~~~
       |
   In function 'strnlen',
       inlined from 'strlen' at include/linux/fortify-string.h:103:8,
       inlined from 'uart_line_info'@drivers/tty/serial/serial_core.c:18=
60:3:
>> include/linux/fortify-string.h:20:45: warning: use of uninitialized valu=
e '*(unsigned char *)(&stat_buf[31])' [CWE-457] [-Wanalyzer-use-of-uninitia=
lized-value]
      20 |                 if (__builtin_constant_p(__p[p_len]) && \
         |                                          ~~~^~~~~~~
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
      77 |         size_t p_len =3D __compiletime_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~~
     'uart_proc_show': events 1-4
       |
       |drivers/tty/serial/serial_core.c:1878:12:
       | 1878 | static int uart_proc_show(struct seq_file *m, void *v)
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'uart_proc_show'
       |......
       | 1885 |         for (i =3D 0; i < drv->nr; i++)
       |      |                     ~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch...
       | 1886 |                 uart_line_info(m, drv, i);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |      |                 (4) calling 'uart_line_info' from 'uart_pro=
c_show'
       |
       +--> 'uart_line_info': events 5-12
              |
              | 1798 | static void uart_line_info(struct seq_file *m, struc=
t uart_driver *drv, int i)
              |      |             ^~~~~~~~~~~~~~
              |      |             |
              |      |             (5) entry to 'uart_line_info'
              |......
              | 1804 |         char stat_buf[32];
              |      |              ~~~~~~~~
              |      |              |
              |      |              (6) region created on stack here
              |......
              | 1810 |         if (!uport)
              |      |            ~ =

              |      |            |
              |      |            (7) following 'false' branch...
              |......
              | 1813 |         mmio =3D uport->iotype >=3D UPIO_MEM;
              |      |                ~~~~~~~~~~~~~
              |      |                     |
              |      |                     (8) ...to here
              |......
              | 1821 |         if (uport->type =3D=3D PORT_UNKNOWN) {
              |      |            ~ =

              |      |            |
              |      |            (9) following 'false' branch...
              |......
              | 1826 |         if (capable(CAP_SYS_ADMIN)) {
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~
              |      |            ||
              |      |            |(10) ...to here
              |      |            (11) following 'true' branch...
              | 1827 |                 pm_state =3D state->pm_state;
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (12) ...to here
              |
            'uart_line_info': event 13
              |
              | 1850 |         if (uport->mctrl & (bit)) \
              |      |            ^
              |      |            |
              |      |            (13) following 'true' branch...
   drivers/tty/serial/serial_core.c:1860:17: note: in expansion of macro 'I=
NFOBIT'
              | 1860 |                 INFOBIT(TIOCM_RTS, "|RTS");
              |      |                 ^~~~~~~
              |
            'uart_line_info': event 14
              |
              |include/linux/fortify-string.h:20:45:
              |   20 |                 if (__builtin_constant_p(__p[p_len])=
 && \
              |      |                                          ~~~^~~~~~~
              |      |                                             |
              |      |                                             (14) ...=
to here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
              |   77 |         size_t p_len =3D __compiletime_strlen(p);
              |      |                        ^~~~~~~~~~~~~~~~~~~~
              |
            'uart_line_info': event 15
              |
              |   20 |                 if (__builtin_constant_p(__p[p_len])=
 && \
              |      |                                          ~~~^~~~~~~
              |      |                                             |
              |      |                                             (15) use=
 of uninitialized value '*(unsigned char *)(&stat_buf[31])' here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
              |   77 |         size_t p_len =3D __compiletime_strlen(p);
              |      |                        ^~~~~~~~~~~~~~~~~~~~
              |
   In function 'strnlen',
       inlined from 'strlen' at include/linux/fortify-string.h:103:8,
       inlined from 'strncat' at include/linux/fortify-string.h:192:10,
       inlined from 'uart_line_info' at drivers/tty/serial/serial_core.c:18=
60:3:
>> include/linux/fortify-string.h:20:45: warning: use of uninitialized valu=
e '*(unsigned char *)(&stat_buf[31])' [CWE-457] [-Wanalyzer-use-of-uninitia=
lized-value]
      20 |                 if (__builtin_constant_p(__p[p_len]) && \
         |                                          ~~~^~~~~~~
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
      77 |         size_t p_len =3D __compiletime_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~~
     'uart_proc_show': events 1-4
       |
       |drivers/tty/serial/serial_core.c:1878:12:
       | 1878 | static int uart_proc_show(struct seq_file *m, void *v)
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'uart_proc_show'
       |......
       | 1885 |         for (i =3D 0; i < drv->nr; i++)
       |      |                     ~~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch...
       | 1886 |                 uart_line_info(m, drv, i);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |      |                 (4) calling 'uart_line_info' from 'uart_pro=
c_show'
       |
       +--> 'uart_line_info': events 5-12
              |
              | 1798 | static void uart_line_info(struct seq_file *m, struc=
t uart_driver *drv, int i)
              |      |             ^~~~~~~~~~~~~~
              |      |             |
              |      |             (5) entry to 'uart_line_info'
              |......
              | 1804 |         char stat_buf[32];
              |      |              ~~~~~~~~
              |      |              |
              |      |              (6) region created on stack here
              |......
              | 1810 |         if (!uport)
              |      |            ~ =

              |      |            |
              |      |            (7) following 'false' branch...
              |......
              | 1813 |         mmio =3D uport->iotype >=3D UPIO_MEM;
              |      |                ~~~~~~~~~~~~~
              |      |                     |
              |      |                     (8) ...to here
              |......
              | 1821 |         if (uport->type =3D=3D PORT_UNKNOWN) {
              |      |            ~ =

              |      |            |
              |      |            (9) following 'false' branch...
              |......
              | 1826 |         if (capable(CAP_SYS_ADMIN)) {
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~
              |      |            ||
              |      |            |(10) ...to here
              |      |            (11) following 'true' branch...
              | 1827 |                 pm_state =3D state->pm_state;
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (12) ...to here
              |
            'uart_line_info': event 13
              |
              | 1850 |         if (uport->mctrl & (bit)) \
              |      |            ^
              |      |            |
              |      |            (13) following 'true' branch...
   drivers/tty/serial/serial_core.c:1860:17: note: in expansion of macro 'I=
NFOBIT'
              | 1860 |                 INFOBIT(TIOCM_RTS, "|RTS");
              |      |                 ^~~~~~~
              |
            'uart_line_info': event 14
              |
              |include/linux/fortify-string.h:20:45:
              |   20 |                 if (__builtin_constant_p(__p[p_len])=
 && \
              |      |                                          ~~~^~~~~~~
              |      |                                             |
              |      |                                             (14) ...=
to here
   include/linux/fortify-string.h:77:24: note: in expansion of macro '__com=
piletime_strlen'
              |   77 |         size_t p_len =3D __compiletime_strlen(p);
              |      |                        ^~~~~~~~~~~~~~~~~~~~
              |
            'uart_line_info': events 15-17
              |
              |   89 |         if (p_size <=3D ret && maxlen !=3D ret)
              |      |            ^
              |      |            |
              |      |            (15) following 'false' branch...
              |......
              |  104 |         if (p_size <=3D ret)
              |      |            ~
              |      |            |
              |      |            (16) ...to here
              |      |            (17) following 'false' branch...
              |
            'uart_line_info': event 18
              |
              |drivers/tty/serial/serial_core.c:1851:17:
              | 1851 |                 strncat(stat_buf, (str), sizeof(stat=
_buf) - \
              |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |                 |

vim +20 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  12  =

3009f891bb9f32 Kees Cook      2021-08-02  13  #define __compiletime_strlen(=
p)				\
3009f891bb9f32 Kees Cook      2021-08-02  14  ({							\
3009f891bb9f32 Kees Cook      2021-08-02  15  	unsigned char *__p =3D (unsi=
gned char *)(p);      \
3009f891bb9f32 Kees Cook      2021-08-02  16  	size_t ret =3D (size_t)-1;		=
	\
3009f891bb9f32 Kees Cook      2021-08-02  17  	size_t p_size =3D __builtin_=
object_size(p, 1);	\
3009f891bb9f32 Kees Cook      2021-08-02  18  	if (p_size !=3D (size_t)-1) =
{			\
3009f891bb9f32 Kees Cook      2021-08-02  19  		size_t p_len =3D p_size - 1=
;		\
3009f891bb9f32 Kees Cook      2021-08-02 @20  		if (__builtin_constant_p(__=
p[p_len]) &&	\
3009f891bb9f32 Kees Cook      2021-08-02  21  		    __p[p_len] =3D=3D '\0')=
			\
3009f891bb9f32 Kees Cook      2021-08-02  22  			ret =3D __builtin_strlen(_=
_p);	\
3009f891bb9f32 Kees Cook      2021-08-02  23  	}						\
3009f891bb9f32 Kees Cook      2021-08-02  24  	ret;						\
3009f891bb9f32 Kees Cook      2021-08-02  25  })
3009f891bb9f32 Kees Cook      2021-08-02  26  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6590061194878900614==--

