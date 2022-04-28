Content-Type: multipart/mixed; boundary="===============8559714684390560065=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.18.y-rt-rebase 17/78] kernel/printk/printk.c:3211:4: warning: Value stored to 'any_usable' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 29 Apr 2022 05:42:18 +0800
Message-ID: <202204290515.UOPQrJ9w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8559714684390560065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.18.y-rt-rebase
head:   32db7abd98134c688b08d269ff72b7720423eb45
commit: 63a3c2fa9545cff5419ff2ec2458cbb41d838d97 [17/78] serial: 8250: impl=
ement write_atomic
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220428 (https://download.01.org/0day-ci/arc=
hive/20220429/202204290515.UOPQrJ9w-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3D63a3c2fa9545cff5419ff2ec2458cbb41d838d97
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.18.y-rt-rebase
        git checkout 63a3c2fa9545cff5419ff2ec2458cbb41d838d97
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^~~~~~~~
   kernel/printk/printk.c:2050:17: note: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11
                   dropped_len =3D snprintf(dropped_text, DROPPED_TEXT_MAX,
                                 ^~~~~~~~
   kernel/printk/printk.c:2224:4: warning: Call to function 'memmove' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(text, text + prefix_len, text_len);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2224:4: note: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11
                           memmove(text, text + prefix_len, text_len);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2270:17: warning: Call to function 'vsnprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           reserve_size =3D vsnprintf(&prefix_buf[0], sizeof(prefix_buf), f=
mt, args2) + 1;
                          ^~~~~~~~~
   kernel/printk/printk.c:2270:17: note: Call to function 'vsnprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'vsnprintf_s' in case of C11
           reserve_size =3D vsnprintf(&prefix_buf[0], sizeof(prefix_buf), f=
mt, args2) + 1;
                          ^~~~~~~~~
   kernel/printk/printk.c:2323:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&r.text_buf[text_len], trunc_msg, trunc_msg_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2323:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(&r.text_buf[text_len], trunc_msg, trunc_msg_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2331:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&r.info->dev_info, dev_info, sizeof(r.info->dev_i=
nfo));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2331:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(&r.info->dev_info, dev_info, sizeof(r.info->dev_i=
nfo));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2633:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf + 4, str, sizeof(buf) - 5);
                   ^~~~~~~
   kernel/printk/printk.c:2633:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf + 4, str, sizeof(buf) - 5);
                   ^~~~~~~
   kernel/printk/printk.c:2635:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(buf, str, sizeof(buf) - 1);
                   ^~~~~~~
   kernel/printk/printk.c:2635:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(buf, str, sizeof(buf) - 1);
                   ^~~~~~~
>> kernel/printk/printk.c:3211:4: warning: Value stored to 'any_usable' is =
never read [clang-analyzer-deadcode.DeadStores]
                           any_usable =3D true;
                           ^            ~~~~
   kernel/printk/printk.c:3211:4: note: Value stored to 'any_usable' is nev=
er read
                           any_usable =3D true;
                           ^            ~~~~
   Suppressed 54 warnings (46 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   drivers/nfc/st-nci/spi.c:102:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(skb_rx->data, buf, skb->len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/nfc/st-nci/spi.c:102:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(skb_rx->data, buf, skb->len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/nfc/st-nci/spi.c:146:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((*skb)->data, buf, ST_NCI_SPI_MIN_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/nfc/st-nci/spi.c:146:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy((*skb)->data, buf, ST_NCI_SPI_MIN_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/nfc/st-nci/spi.c:159:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((*skb)->data + ST_NCI_SPI_MIN_SIZE, buf, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/nfc/st-nci/spi.c:159:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy((*skb)->data + ST_NCI_SPI_MIN_SIZE, buf, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 85 warnings (78 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   93 warnings generated.
   Suppressed 93 warnings (86 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   drivers/net/wan/hdlc_raw_eth.c:37:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(skb->data + len, 0, pad);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \

vim +/any_usable +3211 kernel/printk/printk.c

38fad3f014835f John Ogness 2022-02-04  3200  =

38fad3f014835f John Ogness 2022-02-04  3201  	printk_cpu_sync_get_irqsave(f=
lags);
38fad3f014835f John Ogness 2022-02-04  3202  =

38fad3f014835f John Ogness 2022-02-04  3203  	do {
38fad3f014835f John Ogness 2022-02-04  3204  		any_progress =3D false;
38fad3f014835f John Ogness 2022-02-04  3205  =

38fad3f014835f John Ogness 2022-02-04  3206  		for_each_console(con) {
38fad3f014835f John Ogness 2022-02-04  3207  			bool progress;
38fad3f014835f John Ogness 2022-02-04  3208  =

38fad3f014835f John Ogness 2022-02-04  3209  			if (!console_is_usable(con,=
 true))
38fad3f014835f John Ogness 2022-02-04  3210  				continue;
38fad3f014835f John Ogness 2022-02-04 @3211  			any_usable =3D true;
38fad3f014835f John Ogness 2022-02-04  3212  =

38fad3f014835f John Ogness 2022-02-04  3213  			if (con->flags & CON_EXTEND=
ED) {
38fad3f014835f John Ogness 2022-02-04  3214  				/* Extended consoles do no=
t print "dropped messages". */
38fad3f014835f John Ogness 2022-02-04  3215  				progress =3D console_emit_=
next_record(con,
38fad3f014835f John Ogness 2022-02-04  3216  							&con->atomic_data->text=
[index],
38fad3f014835f John Ogness 2022-02-04  3217  							&con->atomic_data->ext_=
text[index],
38fad3f014835f John Ogness 2022-02-04  3218  							NULL,
38fad3f014835f John Ogness 2022-02-04  3219  							true);
38fad3f014835f John Ogness 2022-02-04  3220  			} else {
38fad3f014835f John Ogness 2022-02-04  3221  				progress =3D console_emit_=
next_record(con,
38fad3f014835f John Ogness 2022-02-04  3222  							&con->atomic_data->text=
[index],
38fad3f014835f John Ogness 2022-02-04  3223  							NULL,
38fad3f014835f John Ogness 2022-02-04  3224  							&con->atomic_data->drop=
ped_text[index],
38fad3f014835f John Ogness 2022-02-04  3225  							true);
38fad3f014835f John Ogness 2022-02-04  3226  			}
38fad3f014835f John Ogness 2022-02-04  3227  =

38fad3f014835f John Ogness 2022-02-04  3228  			if (!progress)
38fad3f014835f John Ogness 2022-02-04  3229  				continue;
38fad3f014835f John Ogness 2022-02-04  3230  			any_progress =3D true;
38fad3f014835f John Ogness 2022-02-04  3231  =

38fad3f014835f John Ogness 2022-02-04  3232  			touch_softlockup_watchdog_s=
ync();
38fad3f014835f John Ogness 2022-02-04  3233  			clocksource_touch_watchdog(=
);
38fad3f014835f John Ogness 2022-02-04  3234  			rcu_cpu_stall_reset();
38fad3f014835f John Ogness 2022-02-04  3235  			touch_nmi_watchdog();
38fad3f014835f John Ogness 2022-02-04  3236  		}
38fad3f014835f John Ogness 2022-02-04  3237  	} while (any_progress);
38fad3f014835f John Ogness 2022-02-04  3238  =

38fad3f014835f John Ogness 2022-02-04  3239  	printk_cpu_sync_put_irqrestor=
e(flags);
38fad3f014835f John Ogness 2022-02-04  3240  }
38fad3f014835f John Ogness 2022-02-04  3241  #else /* CONFIG_HAVE_ATOMIC_CO=
NSOLE */
38fad3f014835f John Ogness 2022-02-04  3242  #define atomic_console_flush_a=
ll()
38fad3f014835f John Ogness 2022-02-04  3243  #endif
38fad3f014835f John Ogness 2022-02-04  3244  =


:::::: The code at line 3211 was first introduced by commit
:::::: 38fad3f014835febe177b238e83a9bf29bb26d30 printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8559714684390560065==--

