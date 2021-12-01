Content-Type: multipart/mixed; boundary="===============6819247310247372314=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/max98373-sdw.c:789:26: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 01 Dec 2021 22:05:28 +0800
Message-ID: <202112012111.HwiCDMP2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6819247310247372314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: 349dd23931d1943b1083182e35715eba8b150fe1 ASoC: max98373: don't acce=
ss volatile registers in bias level off
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20211118 (https://download.01.org/0day-ci/arc=
hive/20211201/202112012111.HwiCDMP2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D349dd23931d1943b1083182e35715eba8b150fe1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 349dd23931d1943b1083182e35715eba8b150fe1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   lib/zstd/decompress.c:1557:4: warning: Value stored to 'remainingSize' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           remainingSize -=3D 4;
                           ^                ~
   lib/zstd/decompress.c:1557:4: note: Value stored to 'remainingSize' is n=
ever read
                           remainingSize -=3D 4;
                           ^                ~
   Suppressed 11 warnings (6 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   fs/hpfs/ea.c:260:3: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ea->name, key);
                   ^~~~~~
   fs/hpfs/ea.c:260:3: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                   strcpy(ea->name, key);
                   ^~~~~~
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
   18 warnings generated.
   kernel/sched/core.c:4243:16: warning: Value stored to 'preempt_disable_i=
p' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:4243:16: note: Value stored to 'preempt_disable_ip' =
during its initialization is never read
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:7096:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7096:3: note: Value stored to 'ptr' is never read
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (14 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> sound/soc/codecs/max98373-sdw.c:789:26: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^
   sound/soc/codecs/max98373-sdw.c:854:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   sound/soc/codecs/max98373-sdw.c:857:9: note: Calling 'max98373_init'
           return max98373_init(slave, regmap);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:6: note: Assuming 'max98373' is non-=
null
           if (!max98373)
               ^~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:2: note: Taking false branch
           if (!max98373)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:39: note: The value 3 is assigned to=
 'i'
           for (i =3D 0; i < max98373->cache_num; i++)
                                                ^~~
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:789:26: note: Assigned value is garbage =
or undefined
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   11 warnings generated.
   drivers/fsi/fsi-core.c:719:4: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:719:4: note: Value stored to 'rc' is never read
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:724:2: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rc =3D count;
           ^    ~~~~~
   drivers/fsi/fsi-core.c:724:2: note: Value stored to 'rc' is never read
           rc =3D count;
           ^    ~~~~~
   drivers/fsi/fsi-core.c:753:4: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:753:4: note: Value stored to 'rc' is never read
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:761:2: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rc =3D count;
           ^    ~~~~~
   drivers/fsi/fsi-core.c:761:2: note: Value stored to 'rc' is never read
           rc =3D count;
           ^    ~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
--
                               ^~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
   drivers/hwmon/adm9240.c:157:2: warning: Value stored to 'old' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           old =3D (reg >> shift) & 3;
           ^     ~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adm9240.c:157:2: note: Value stored to 'old' is never read
           old =3D (reg >> shift) & 3;
           ^     ~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adm9240.c:510:21: warning: Value stored to 'client' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D data->client;
                              ^~~~~~   ~~~~~~~~~~~~
   drivers/hwmon/adm9240.c:510:21: note: Value stored to 'client' during it=
s initialization is never read
           struct i2c_client *client =3D data->client;
                              ^~~~~~   ~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> sound/soc/codecs/max98373-sdw.c:789:26: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^
   sound/soc/codecs/max98373-sdw.c:854:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   sound/soc/codecs/max98373-sdw.c:857:9: note: Calling 'max98373_init'
           return max98373_init(slave, regmap);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:6: note: Assuming 'max98373' is non-=
null
           if (!max98373)
               ^~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:776:2: note: Taking false branch
           if (!max98373)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:788:39: note: The value 3 is assigned to=
 'i'
           for (i =3D 0; i < max98373->cache_num; i++)
                                                ^~~
   sound/soc/codecs/max98373-sdw.c:788:14: note: Assuming 'i' is < field 'c=
ache_num'
           for (i =3D 0; i < max98373->cache_num; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98373-sdw.c:788:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < max98373->cache_num; i++)
           ^
   sound/soc/codecs/max98373-sdw.c:789:26: note: Assigned value is garbage =
or undefined
                   max98373->cache[i].reg =3D max98373_sdw_cache_reg[i];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/hfsplus/bnode.c:328:4: warning: Value stored to 'tmp' is never read [=
clang-analyzer-deadcode.DeadStores]
                           tmp =3D hfs_bnode_read_u16(node, key_off);
                           ^
   fs/hfsplus/bnode.c:328:4: note: Value stored to 'tmp' is never read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/hfsplus/bfind.c:73:3: warning: Value stored to 'cur_cnid' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   cur_cnid =3D 0;   /* used-uninitialized warning */
                   ^          ~
   fs/hfsplus/bfind.c:73:3: note: Value stored to 'cur_cnid' is never read
                   cur_cnid =3D 0;   /* used-uninitialized warning */
                   ^          ~
   fs/hfsplus/bfind.c:74:3: warning: Value stored to 'search_cnid' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   search_cnid =3D 0;
                   ^             ~
   fs/hfsplus/bfind.c:74:3: note: Value stored to 'search_cnid' is never re=
ad
                   search_cnid =3D 0;
                   ^             ~
   fs/hfsplus/bfind.c:180:2: warning: Value stored to 'res' is never read [=
clang-analyzer-deadcode.DeadStores]
           res =3D 0;
           ^     ~
   fs/hfsplus/bfind.c:180:2: note: Value stored to 'res' is never read
           res =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).

vim +789 sound/soc/codecs/max98373-sdw.c

56a5b7910e965c Ryan Lee  2020-07-08  766  =

56a5b7910e965c Ryan Lee  2020-07-08  767  static int max98373_init(struct s=
dw_slave *slave, struct regmap *regmap)
56a5b7910e965c Ryan Lee  2020-07-08  768  {
56a5b7910e965c Ryan Lee  2020-07-08  769  	struct max98373_priv *max98373;
56a5b7910e965c Ryan Lee  2020-07-08  770  	int ret;
349dd23931d194 Bard Liao 2020-12-17  771  	int i;
56a5b7910e965c Ryan Lee  2020-07-08  772  	struct device *dev =3D &slave->d=
ev;
56a5b7910e965c Ryan Lee  2020-07-08  773  =

56a5b7910e965c Ryan Lee  2020-07-08  774  	/*  Allocate and assign private =
driver data structure  */
56a5b7910e965c Ryan Lee  2020-07-08  775  	max98373 =3D devm_kzalloc(dev, s=
izeof(*max98373), GFP_KERNEL);
56a5b7910e965c Ryan Lee  2020-07-08  776  	if (!max98373)
56a5b7910e965c Ryan Lee  2020-07-08  777  		return -ENOMEM;
56a5b7910e965c Ryan Lee  2020-07-08  778  =

56a5b7910e965c Ryan Lee  2020-07-08  779  	dev_set_drvdata(dev, max98373);
56a5b7910e965c Ryan Lee  2020-07-08  780  	max98373->regmap =3D regmap;
56a5b7910e965c Ryan Lee  2020-07-08  781  	max98373->slave =3D slave;
56a5b7910e965c Ryan Lee  2020-07-08  782  =

349dd23931d194 Bard Liao 2020-12-17  783  	max98373->cache_num =3D ARRAY_SI=
ZE(max98373_sdw_cache_reg);
349dd23931d194 Bard Liao 2020-12-17  784  	max98373->cache =3D devm_kcalloc=
(dev, max98373->cache_num,
349dd23931d194 Bard Liao 2020-12-17  785  				       sizeof(*max98373->cach=
e),
349dd23931d194 Bard Liao 2020-12-17  786  				       GFP_KERNEL);
349dd23931d194 Bard Liao 2020-12-17  787  =

349dd23931d194 Bard Liao 2020-12-17  788  	for (i =3D 0; i < max98373->cach=
e_num; i++)
349dd23931d194 Bard Liao 2020-12-17 @789  		max98373->cache[i].reg =3D max9=
8373_sdw_cache_reg[i];
349dd23931d194 Bard Liao 2020-12-17  790  =

56a5b7910e965c Ryan Lee  2020-07-08  791  	/* Read voltage and slot configu=
ration */
56a5b7910e965c Ryan Lee  2020-07-08  792  	max98373_slot_config(dev, max983=
73);
56a5b7910e965c Ryan Lee  2020-07-08  793  =

56a5b7910e965c Ryan Lee  2020-07-08  794  	max98373->hw_init =3D false;
56a5b7910e965c Ryan Lee  2020-07-08  795  	max98373->pm_init_once =3D false;
56a5b7910e965c Ryan Lee  2020-07-08  796  =

56a5b7910e965c Ryan Lee  2020-07-08  797  	/* codec registration  */
56a5b7910e965c Ryan Lee  2020-07-08  798  	ret =3D devm_snd_soc_register_co=
mponent(dev, &soc_codec_dev_max98373_sdw,
56a5b7910e965c Ryan Lee  2020-07-08  799  					      max98373_sdw_dai,
56a5b7910e965c Ryan Lee  2020-07-08  800  					      ARRAY_SIZE(max98373_sd=
w_dai));
56a5b7910e965c Ryan Lee  2020-07-08  801  	if (ret < 0)
56a5b7910e965c Ryan Lee  2020-07-08  802  		dev_err(dev, "Failed to registe=
r codec: %d\n", ret);
56a5b7910e965c Ryan Lee  2020-07-08  803  =

56a5b7910e965c Ryan Lee  2020-07-08  804  	return ret;
56a5b7910e965c Ryan Lee  2020-07-08  805  }
56a5b7910e965c Ryan Lee  2020-07-08  806  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6819247310247372314==--

