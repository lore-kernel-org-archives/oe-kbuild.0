Content-Type: multipart/mixed; boundary="===============7569157859838608443=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alexandrebelloni:rtc-misc 3/9] drivers/rtc/dev.c:420:4: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 04 Aug 2021 14:09:52 +0800
Message-ID: <202108041442.T5TaGVxO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7569157859838608443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alexandre Belloni <alexandre.belloni@free-electrons.com>

tree:   https://github.com/alexandrebelloni/linux rtc-misc
head:   e133d60472e6fd2c66009703416386df7688d342
commit: 36c52b4430b4cb116160a2fd5c9b0cdf9de32f6f [3/9] WIP PARAMS
:::::: branch date: 8 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c001-20210804 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 4f71f5=
9bf3d9914188a11d0c41bedbb339d36ff5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/alexandrebelloni/linux/commit/36c52b4430b4cb11=
6160a2fd5c9b0cdf9de32f6f
        git remote add alexandrebelloni https://github.com/alexandrebelloni=
/linux
        git fetch --no-tags alexandrebelloni rtc-misc
        git checkout 36c52b4430b4cb116160a2fd5c9b0cdf9de32f6f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1293:3: note: Value stored to 'error' is never read
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/nfs/direct.c:703:19: warning: Value stored to 'req' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct nfs_page *req =3D nfs_list_entry(hdr->pages.next);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/direct.c:703:19: note: Value stored to 'req' during its initializ=
ation is never read
           struct nfs_page *req =3D nfs_list_entry(hdr->pages.next);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/rtc/dev.c:420:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D -EFAULT;
                           ^     ~~~~~~~
   drivers/rtc/dev.c:420:4: note: Value stored to 'err' is never read
                           err =3D -EFAULT;
                           ^     ~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/rtc/rtc-ab-eoz9.c:552:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-ab-eoz9.c:552:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D device_init_wakeup(dev, true);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/rtc/rtc-abx80x.c:534:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-abx80x.c:534:3: note: Value stored to 'status' is never =
read
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/staging/greybus/audio_topology.c:814:3: warning: Value stored to=
 'mask' is never read [clang-analyzer-deadcode.DeadStores]
                   mask |=3D e->mask << e->shift_r;
                   ^       ~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_topology.c:814:3: note: Value stored to 'm=
ask' is never read
                   mask |=3D e->mask << e->shift_r;
                   ^       ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/acpi/acpi_processor.c:370:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_PROCESSOR_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/acpi_processor.c:370:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_PROCESSOR_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/acpi_processor.c:371:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_PROCESSOR_CLASS);
           ^~~~~~
   drivers/acpi/acpi_processor.c:371:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_PROCESSOR_CLASS);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/err +420 drivers/rtc/dev.c

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  202  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  203  sta=
tic long rtc_dev_ioctl(struct file *file,
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  204  			=
  unsigned int cmd, unsigned long arg)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  205  {
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  206  	in=
t err =3D 0;
ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  207  	st=
ruct rtc_device *rtc =3D file->private_data;
ff8371ac9a5a55 drivers/rtc/rtc-dev.c David Brownell    2006-09-30  208  	co=
nst struct rtc_class_ops *ops =3D rtc->ops;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  209  	st=
ruct rtc_time tm;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  210  	st=
ruct rtc_wkalrm alarm;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  211  	st=
ruct rtc_param param;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  212  	vo=
id __user *uarg =3D (void __user *)arg;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  213  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  214  	er=
r =3D mutex_lock_interruptible(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  215  	if=
 (err)
b68bb2632453a9 drivers/rtc/rtc-dev.c David Brownell    2008-07-29  216  		r=
eturn err;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  217  =

2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  218  	/*=
 check that the calling task has appropriate permissions
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  219  	 *=
 for certain ioctls. doing this check here is useful
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  220  	 *=
 to avoid duplicate code in each driver.
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  221  	 */
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  222  	sw=
itch (cmd) {
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  223  	ca=
se RTC_EPOCH_SET:
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  224  	ca=
se RTC_SET_TIME:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  225  	ca=
se RTC_PARAM_SET:
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  226  		i=
f (!capable(CAP_SYS_TIME))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  227  			=
err =3D -EACCES;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  228  		b=
reak;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  229  =

110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  230  	ca=
se RTC_IRQP_SET:
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  231  		i=
f (arg > rtc->max_user_freq && !capable(CAP_SYS_RESOURCE))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  232  			=
err =3D -EACCES;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  233  		b=
reak;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  234  =

110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  235  	ca=
se RTC_PIE_ON:
9d013d3b14f4c8 drivers/rtc/rtc-dev.c Bryan Kadzban     2007-10-16  236  		i=
f (rtc->irq_freq > rtc->max_user_freq &&
9d013d3b14f4c8 drivers/rtc/rtc-dev.c Bryan Kadzban     2007-10-16  237  		 =
   !capable(CAP_SYS_RESOURCE))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  238  			=
err =3D -EACCES;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  239  		b=
reak;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  240  	}
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  241  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  242  	if=
 (err)
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  243  		g=
oto done;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  244  =

ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  245  	/*
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  246  	 *=
 Drivers *SHOULD NOT* provide ioctl implementations
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  247  	 *=
 for these requests.  Instead, provide methods to
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  248  	 *=
 support the following code, so that the RTC's main
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  249  	 *=
 features are accessible without using ioctls.
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  250  	 *
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  251  	 *=
 RTC and alarm times will be in UTC, by preference,
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  252  	 *=
 but dual-booting with MS-Windows implies RTCs must
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  253  	 *=
 use the local wall clock time.
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  254  	 */
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  255  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  256  	sw=
itch (cmd) {
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  257  	ca=
se RTC_ALM_READ:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  258  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  259  =

ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  260  		e=
rr =3D rtc_read_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  261  		i=
f (err < 0)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  262  			=
return err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  263  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  264  		i=
f (copy_to_user(uarg, &alarm.time, sizeof(tm)))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  265  			=
err =3D -EFAULT;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  266  		r=
eturn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  267  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  268  	ca=
se RTC_ALM_SET:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  269  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  270  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  271  		i=
f (copy_from_user(&alarm.time, uarg, sizeof(tm)))
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  272  			=
return -EFAULT;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  273  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  274  		a=
larm.enabled =3D 0;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  275  		a=
larm.pending =3D 0;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  276  		a=
larm.time.tm_wday =3D -1;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  277  		a=
larm.time.tm_yday =3D -1;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  278  		a=
larm.time.tm_isdst =3D -1;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  279  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  280  		/=
* RTC_ALM_SET alarms may be up to 24 hours in the future.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  281  		 =
* Rather than expecting every RTC to implement "don't care"
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  282  		 =
* for day/month/year fields, just force the alarm to have
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  283  		 =
* the right values for those fields.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  284  		 *
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  285  		 =
* RTC_WKALM_SET should be used instead.  Not only does it
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  286  		 =
* eliminate the need for a separate RTC_AIE_ON call, it
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  287  		 =
* doesn't have the "alarm 23:59:59 in the future" race.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  288  		 *
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  289  		 =
* NOTE:  some legacy code may have used invalid fields as
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  290  		 =
* wildcards, exposing hardware "periodic alarm" capabilities.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  291  		 =
* Not supported here.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  292  		 =
*/
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  293  		{
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  294  			=
time64_t now, then;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  295  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  296  			=
err =3D rtc_read_time(rtc, &tm);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  297  			=
if (err < 0)
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  298  			=
	return err;
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  299  			=
now =3D rtc_tm_to_time64(&tm);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  300  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  301  			=
alarm.time.tm_mday =3D tm.tm_mday;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  302  			=
alarm.time.tm_mon =3D tm.tm_mon;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  303  			=
alarm.time.tm_year =3D tm.tm_year;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  304  			=
err  =3D rtc_valid_tm(&alarm.time);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  305  			=
if (err < 0)
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  306  			=
	return err;
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  307  			=
then =3D rtc_tm_to_time64(&alarm.time);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  308  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  309  			=
/* alarm may need to wrap into tomorrow */
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  310  			=
if (then < now) {
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  311  			=
	rtc_time64_to_tm(now + 24 * 60 * 60, &tm);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  312  			=
	alarm.time.tm_mday =3D tm.tm_mday;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  313  			=
	alarm.time.tm_mon =3D tm.tm_mon;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  314  			=
	alarm.time.tm_year =3D tm.tm_year;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  315  			}
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  316  		}
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  317  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  318  		r=
eturn rtc_set_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  319  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  320  	ca=
se RTC_RD_TIME:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  321  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  322  =

ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  323  		e=
rr =3D rtc_read_time(rtc, &tm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  324  		i=
f (err < 0)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  325  			=
return err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  326  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  327  		i=
f (copy_to_user(uarg, &tm, sizeof(tm)))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  328  			=
err =3D -EFAULT;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  329  		r=
eturn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  330  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  331  	ca=
se RTC_SET_TIME:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  332  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  333  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  334  		i=
f (copy_from_user(&tm, uarg, sizeof(tm)))
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  335  			=
return -EFAULT;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  336  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  337  		r=
eturn rtc_set_time(rtc, &tm);
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  338  =

d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  339  	ca=
se RTC_PIE_ON:
8719d3c9188b38 drivers/rtc/rtc-dev.c Alexandre Belloni 2018-07-25  340  		e=
rr =3D rtc_irq_set_state(rtc, 1);
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  341  		b=
reak;
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  342  =

d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  343  	ca=
se RTC_PIE_OFF:
8719d3c9188b38 drivers/rtc/rtc-dev.c Alexandre Belloni 2018-07-25  344  		e=
rr =3D rtc_irq_set_state(rtc, 0);
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  345  		b=
reak;
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  346  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  347  	ca=
se RTC_AIE_ON:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  348  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  349  		r=
eturn rtc_alarm_irq_enable(rtc, 1);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  350  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  351  	ca=
se RTC_AIE_OFF:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  352  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  353  		r=
eturn rtc_alarm_irq_enable(rtc, 0);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  354  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  355  	ca=
se RTC_UIE_ON:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  356  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  357  		r=
eturn rtc_update_irq_enable(rtc, 1);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  358  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  359  	ca=
se RTC_UIE_OFF:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  360  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  361  		r=
eturn rtc_update_irq_enable(rtc, 0);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  362  =

2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  363  	ca=
se RTC_IRQP_SET:
8719d3c9188b38 drivers/rtc/rtc-dev.c Alexandre Belloni 2018-07-25  364  		e=
rr =3D rtc_irq_set_freq(rtc, arg);
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  365  		b=
reak;
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  366  	ca=
se RTC_IRQP_READ:
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  367  		e=
rr =3D put_user(rtc->irq_freq, (unsigned long __user *)uarg);
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  368  		b=
reak;
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  369  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  370  	ca=
se RTC_WKALM_SET:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  371  		m=
utex_unlock(&rtc->ops_lock);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  372  		i=
f (copy_from_user(&alarm, uarg, sizeof(alarm)))
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  373  			=
return -EFAULT;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  374  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  375  		r=
eturn rtc_set_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  376  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  377  	ca=
se RTC_WKALM_RD:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  378  		m=
utex_unlock(&rtc->ops_lock);
ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  379  		e=
rr =3D rtc_read_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  380  		i=
f (err < 0)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  381  			=
return err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  382  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  383  		i=
f (copy_to_user(uarg, &alarm, sizeof(alarm)))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  384  			=
err =3D -EFAULT;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  385  		r=
eturn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  386  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  387  	ca=
se RTC_PARAM_GET:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  388  		i=
f (copy_from_user(&param, uarg, sizeof(param)))
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  389  			=
err =3D -EFAULT;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  390  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  391  		s=
witch(param.param) {
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  392  			=
long offset;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  393  		c=
ase RTC_PARAM_FEATURES:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  394  			=
if (param.index !=3D 0)
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  395  			=
	err =3D -EINVAL;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  396  			=
param.uvalue =3D rtc->features[0];
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  397  			=
break;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  398  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  399  		c=
ase RTC_PARAM_CORRECTION:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  400  			=
mutex_unlock(&rtc->ops_lock);
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  401  			=
if (param.index !=3D 0)
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  402  			=
	return -EINVAL;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  403  			=
err =3D rtc_read_offset(rtc, &offset);
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  404  			=
if (err =3D=3D 0)
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  405  			=
	param.svalue =3D offset;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  406  			=
mutex_lock(&rtc->ops_lock);
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  407  			=
break;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  408  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  409  		d=
efault:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  410  			=
err =3D -EINVAL;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  411  		}
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  412  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  413  		i=
f (copy_to_user(uarg, &param, sizeof(param)))
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  414  			=
err =3D -EFAULT;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  415  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  416  		b=
reak;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  417  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  418  	ca=
se RTC_PARAM_SET:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  419  		i=
f (copy_from_user(&param, uarg, sizeof(param)))
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16 @420  			=
err =3D -EFAULT;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  421  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  422  		s=
witch(param.param) {
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  423  		c=
ase RTC_PARAM_CORRECTION:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  424  			=
mutex_unlock(&rtc->ops_lock);
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  425  			=
if (param.index !=3D 0)
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  426  			=
	return -EINVAL;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  427  			=
return rtc_set_offset(rtc, param.svalue);
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  428  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  429  		c=
ase RTC_PARAM_FEATURES:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  430  		d=
efault:
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  431  			=
err =3D -EINVAL;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  432  		}
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  433  =

36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  434  		b=
reak;
36c52b4430b4cb drivers/rtc/dev.c     Alexandre Belloni 2021-01-16  435  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  436  	de=
fault:
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  437  		/=
* Finally try the driver's ioctl interface */
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  438  		i=
f (ops->ioctl) {
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  439  			=
err =3D ops->ioctl(rtc->dev.parent, cmd, arg);
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  440  			=
if (err =3D=3D -ENOIOCTLCMD)
b3969e5831adac drivers/rtc/rtc-dev.c Alessandro Zummo  2006-05-20  441  			=
	err =3D -ENOTTY;
606cc43c720bde drivers/rtc/dev.c     Alexandre Belloni 2019-03-20  442  		}=
 else {
e17fd4ba2a81f1 drivers/rtc/rtc-dev.c John Stultz       2011-05-31  443  			=
err =3D -ENOTTY;
606cc43c720bde drivers/rtc/dev.c     Alexandre Belloni 2019-03-20  444  		}
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  445  		b=
reak;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  446  	}
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  447  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  448  don=
e:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  449  	mu=
tex_unlock(&rtc->ops_lock);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  450  	re=
turn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  451  }
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  452  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7569157859838608443==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
pG/WmQiiiG5qSINHNHhMgyd2p1oElQhBx1/T9d3Q4FtfM2QuKYPAM9FDa9vcZdGsLghYZcISFsDV
m+jh8lpwwDFold1ThUlLXnmiVndERcbKiIxS25FsiyiOdWFii1kyHtNtY8BKMnRXg4fHXWxoQDtE
WkUlVaMc/uWOllVxF5mBYRFVlQs6cH4Y04LYKo1wl5NvYkMqpgwK9o/fTofzd9dRGC8i/dW4RTnG
PTpSugkHgTUR8A6HJUPCAp4gHvPfohLoMOm95Br5F0HS96MOVzWmlZQxVfWHLN79UblF11mx7Pwz
XQIXYr6ouooaVpZifPEMKRUPBLyzE/W1qyJnJRVUcAGMH0rilITZlDszfGSiiA6zLa94nHNPxta2
DQHb5+4ySZkl2dYTAb6lYXnOoM0fNLZlthu10x22QI2ZrdiwySS/mgGvEgtPSumOEr41pPbInZfN
mhpC+aXqSrRMGXxYHuG9ZyR8TQmk2vdwv82YdqjAIOB1tXt7Qmuq3/Cfp+N/3n77vnvdwa/d0/vh
7beP3Zc9VHh4+g1Nd7/iZ/fb3+9fPqkv8W5/etu/DJ53p6f9G+oM+i9SOfzuX48ntPo9nA+7l8N/
d4jVjL4CKaVAmWC9ZgVMQlS6caBIKoxWa84fADF37V2dZilt9NtRAJupNUPVgRTYhEeBEqE4plY5
uWn5jEMsZTo+2tazmZ6uFu2f7c6qxj4ZuznEE6pLUhCcvr+fj4PH42k/OJ4Gz/uX9/1JWxZJDMNb
KjM4Cjxy4dxwF+yBLqm4C6J8xQsvwi2yUvHHXaBLWhg+dB2MJNQkI1bHvT1hvs7f5blLfZfnbg0o
43BJ4baFE9qtt4Gb3sgKhScu9aozCnYvX9uRUFEtF8PRzIiR1SDSKqaBVE9y+dffF/mH2B9VuYL7
04E34bms3RElbg3KM6Xd2fm3v18Oj7//s/8+eJSb/Otp9/783dnbheHwqmChu8F44HaNB+GKmAAA
C/po7giKkPZEb0aXuFsCTu01H02netoqB9WkJFEa+2/n5/3b+fC4O++fBvxNTgKcBIP/HM7PA/bx
cXw8SFS4O++cWQmCxN0eAHu16VbATLHRVZ7F2+H4akpMB+PLCEMTXZqRlgb+I9KoFoJ7xA3NBPH7
iHYbaOZ3xeCwXbdTMZc2wq/HJ11j1A5g7q5rsJi7sNL9HAPiG+KBWzYuHhxYZiYM6L6dOe108b/K
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
anBzEMiz6yUq4FiF/wFC1VlWc8YBAA==
--===============7569157859838608443==--

