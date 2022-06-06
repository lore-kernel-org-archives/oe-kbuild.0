Content-Type: multipart/mixed; boundary="===============0746467018857664626=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 15/16] drivers/base/firmware_loader/main.c:493:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-...
Date: Mon, 06 Jun 2022 16:09:34 +0800
Message-ID: <202206061606.UDm6Gks4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0746467018857664626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/b=
ase/firmware_loader/main.c:493:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d1b6bd094bc2cd055ef96969867f232a079ab965
commit: d551647f3bce231df4a90504e6d3ccb3b38a6f7a [15/16] ANDROID: firmware_=
loader: Add support for customer firmware paths
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20606/202206061606.UDm6Gks4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android13-5.15
        git checkout d551647f3bce231df4a90504e6d3ccb3b38a6f7a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/socket.c:2703:8: note: Calling '___sys_recvmsg'
           err =3D ___sys_recvmsg(sock, msg, &msg_sys, flags, 0);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2670:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/socket.c:2670:2: note: Taking false branch
           if (err < 0)
           ^
   net/socket.c:2674:2: note: Argument to kfree() is the address of the loc=
al variable 'iovstack', which is not memory allocated by malloc()
           kfree(iov);
           ^     ~~~
   net/socket.c:2752:2: warning: Value stored to 'compat_entry' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           compat_entry =3D (struct compat_mmsghdr __user *)mmsg;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2752:2: note: Value stored to 'compat_entry' is never read
           compat_entry =3D (struct compat_mmsghdr __user *)mmsg;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   284 warnings generated.
   Suppressed 284 warnings (2 in non-user code, 282 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/rsutils.c:398:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ACPI_CAST_PTR(char, &aml_resource_source[1]),
                   ^~~~~~
   drivers/acpi/acpica/rsutils.c:398:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(ACPI_CAST_PTR(char, &aml_resource_source[1]),
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (2 in non-user code, 29 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/net/phy/mdio_bus.c:682:21: warning: Value stored to 'phydev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:682:21: note: Value stored to 'phydev' during=
 its initialization is never read
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/base/power/main.c:467:3: warning: Value stored to 'usecs' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   usecs =3D 1;
                   ^       ~
   drivers/base/power/main.c:467:3: note: Value stored to 'usecs' is never =
read
                   usecs =3D 1;
                   ^       ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/base/firmware_loader/main.c:493:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(strpath, val);
           ^~~~~~
   drivers/base/firmware_loader/main.c:493:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(strpath, val);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   block/blk-mq-cpumap.c:21:33: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           return qmap->queue_offset + (q % nr_queues);
                                          ^
   block/blk-mq-cpumap.c:38:2: note: 'nr_queues' initialized here
           unsigned int nr_queues =3D qmap->nr_queues;
           ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Assuming 'cpu' is >=3D 'nr_cpu_ids'
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Loop condition is false. Execution con=
tinues on line 48
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:241:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   block/blk-mq-cpumap.c:48:2: note: Assuming 'cpu' is >=3D 'nr_cpu_ids'
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:790:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:48:2: note: Loop condition is false. Execution con=
tinues on line 54
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:790:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^
   include/linux/cpumask.h:241:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   block/blk-mq-cpumap.c:54:2: note: Assuming 'cpu' is < 'nr_cpu_ids'
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:54:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:241:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   block/blk-mq-cpumap.c:55:7: note: Assuming the condition is false
                   if (map[cpu] !=3D -1)
                       ^~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:55:3: note: Taking false branch
                   if (map[cpu] !=3D -1)
                   ^
   block/blk-mq-cpumap.c:63:7: note: Assuming 'q' is >=3D 'nr_queues'
                   if (q < nr_queues) {
                       ^~~~~~~~~~~~~
   block/blk-mq-cpumap.c:63:3: note: Taking false branch
                   if (q < nr_queues) {
                   ^
   block/blk-mq-cpumap.c:67:8: note: 'first_sibling' is equal to 'cpu'
                           if (first_sibling =3D=3D cpu)
                               ^~~~~~~~~~~~~
   block/blk-mq-cpumap.c:67:4: note: Taking true branch
                           if (first_sibling =3D=3D cpu)

vim +493 drivers/base/firmware_loader/main.c

746058f4304343 drivers/base/firmware_class.c       Ming Lei        2012-10-=
09  486  =

d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  487  static char strpath[PATH_SIZE * CUSTOM_FW_PATH_COUNT];
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  488  static int __init firmware_param_path_set(char *val)
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  489  {
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  490  	int i;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  491  	char *path, *end;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  492  =

d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10 @493  	strcpy(strpath, val);
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  494  	/* Remove leading and trailing spaces from path */
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  495  	path =3D strim(strpath);
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  496  	for (i =3D 0; path && i < CUSTOM_FW_PATH_COUNT; i++) {
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  497  		end =3D strchr(path, ',');
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  498  =

d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  499  		/* Skip continuous token case, for example ',,,' */
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  500  		if (end =3D=3D path) {
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  501  			i--;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  502  			path =3D ++end;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  503  			continue;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  504  		}
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  505  =

d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  506  		if (end !=3D NULL)
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  507  			*end =3D '\0';
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  508  		else {
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  509  			/* end of the string reached and no other tockens ','  */
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  510  			strncpy(fw_path_para[i], path, PATH_SIZE);
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  511  			break;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  512  		}
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  513  =

d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  514  		strncpy(fw_path_para[i], path, PATH_SIZE);
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  515  		path =3D ++end;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  516  	}
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  517  =

d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  518  	return 1;
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  519  }
d551647f3bce23 drivers/base/firmware_loader/main.c Prasad Sodagudi 2022-05-=
10  520  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0746467018857664626==--

