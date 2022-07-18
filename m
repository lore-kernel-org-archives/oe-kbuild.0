Content-Type: multipart/mixed; boundary="===============8715350905125273361=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sysctl.c:317:52: warning: Parameter 'ppos' can be declared with const [constParameter]
Date: Mon, 18 Jul 2022 19:18:38 +0800
Message-ID: <202207181915.QYsE2XZ4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8715350905125273361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/sy=
sctl.c:317:52: warning: Parameter 'ppos' can be declared with const [constP=
arameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Xiaoming Ni <nixiaoming@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ff6992735ade75aae3e35d16b17da1008d753d28
commit: 86b12b6c5d6b46e64bf2e8080528781032e4bd90 aio: move aio sysctl to ai=
o.c
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 86b12b6c5d6b46e64bf2e8080528781032e4bd90
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sysctl.c:317:52: warning: Parameter 'ppos' can be declared with c=
onst [constParameter]
   static bool proc_first_pos_non_zero_ignore(loff_t *ppos,
                                                      ^
>> kernel/sysctl.c:664:19: warning: Parameter 'lenp' can be declared with c=
onst [constParameter]
             size_t *lenp, loff_t *ppos,
                     ^
>> kernel/sysctl.c:880:41: warning: Parameter 'table' can be declared with =
const [constParameter]
   static int proc_taint(struct ctl_table *table, int write,
                                           ^
>> kernel/sysctl.c:961:36: warning: Uninitialized variable: tmp [uninitvar]
     if ((param->min && *param->min > tmp) ||
                                      ^
   kernel/sysctl.c:957:6: note: Assuming condition is false
    if (ret)
        ^
   kernel/sysctl.c:961:36: note: Uninitialized variable: tmp
     if ((param->min && *param->min > tmp) ||
                                      ^
   kernel/sysctl.c:1026:36: warning: Uninitialized variable: tmp [uninitvar]
     if ((param->min && *param->min > tmp) ||
                                      ^
   kernel/sysctl.c:1022:6: note: Assuming condition is false
    if (ret)
        ^
   kernel/sysctl.c:1026:36: note: Uninitialized variable: tmp
     if ((param->min && *param->min > tmp) ||
                                      ^

vim +/ppos +317 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  307  =

f461d2dcd511c0 Christoph Hellwig 2020-04-24  308  /**
f461d2dcd511c0 Christoph Hellwig 2020-04-24  309   * proc_first_pos_non_zer=
o_ignore - check if first position is allowed
f461d2dcd511c0 Christoph Hellwig 2020-04-24  310   * @ppos: file position
f461d2dcd511c0 Christoph Hellwig 2020-04-24  311   * @table: the sysctl tab=
le
f461d2dcd511c0 Christoph Hellwig 2020-04-24  312   *
f461d2dcd511c0 Christoph Hellwig 2020-04-24  313   * Returns true if the fi=
rst position is non-zero and the sysctl_writes_strict
f461d2dcd511c0 Christoph Hellwig 2020-04-24  314   * mode indicates this is=
 not allowed for numeric input types. String proc
f461d2dcd511c0 Christoph Hellwig 2020-04-24  315   * handlers can ignore th=
e return value.
f461d2dcd511c0 Christoph Hellwig 2020-04-24  316   */
f461d2dcd511c0 Christoph Hellwig 2020-04-24 @317  static bool proc_first_po=
s_non_zero_ignore(loff_t *ppos,
f461d2dcd511c0 Christoph Hellwig 2020-04-24  318  					   struct ctl_table =
*table)
^1da177e4c3f41 Linus Torvalds    2005-04-16  319  {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  320  	if (!*ppos)
f461d2dcd511c0 Christoph Hellwig 2020-04-24  321  		return false;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  322  =

f461d2dcd511c0 Christoph Hellwig 2020-04-24  323  	switch (sysctl_writes_st=
rict) {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  324  	case SYSCTL_WRITES_STRIC=
T:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  325  		return true;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  326  	case SYSCTL_WRITES_WARN:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  327  		warn_sysctl_write(table=
);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  328  		return false;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  329  	default:
f461d2dcd511c0 Christoph Hellwig 2020-04-24  330  		return false;
f461d2dcd511c0 Christoph Hellwig 2020-04-24  331  	}
f461d2dcd511c0 Christoph Hellwig 2020-04-24  332  }
f461d2dcd511c0 Christoph Hellwig 2020-04-24  333  =


:::::: The code at line 317 was first introduced by commit
:::::: f461d2dcd511c020a26d4d791fae595c65ed09b6 sysctl: avoid forward decla=
rations

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8715350905125273361==--

