Content-Type: multipart/mixed; boundary="===============8858121890200912939=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sj:damon/next 33/38] mm/damon/sysfs.c:2214 damon_sysfs_existing_target() warn: ignoring unreachable code.
Date: Fri, 29 Apr 2022 16:01:26 +0800
Message-ID: <202204291521.VLq7qci8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8858121890200912939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/=
next
head:   11cb7bdc92f22d4cb105e1774fe4f53bdb6fb2b7
commit: d5d8b1d8bf2e2e4561c0498f5a806159de282a35 [33/38] mm/damon/sysfs: su=
pport online inputs update
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: nios2-randconfig-m031-20220428 (https://download.01.org/0day-ci/arc=
hive/20220429/202204291521.VLq7qci8-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/damon/sysfs.c:2214 damon_sysfs_existing_target() warn: ignoring unreacha=
ble code.

vim +2214 mm/damon/sysfs.c

c747c03e7710319 SeongJae Park 2022-04-28  2199  =

d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2200  /*
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2201   * Search a target in a con=
text that corresponds to the sysfs target input.
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2202   *
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2203   * Return: pointer to the t=
arget if found, NULL if not found, or negative
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2204   * error code if the search=
 failed.
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2205   */
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2206  static struct damon_target =
*damon_sysfs_existing_target(
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2207  		struct damon_sysfs_target=
 *sys_target, struct damon_ctx *ctx)
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2208  {
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2209  	struct pid *pid;
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2210  	struct damon_target *t;
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2211  =

d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2212  	if (ctx->ops.id =3D=3D DAM=
ON_OPS_PADDR) {
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2213  		/* Up to only one target =
for paddr could exist */
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15 @2214  		damon_for_each_target(t, =
ctx)
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2215  			return t;
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2216  		return NULL;
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2217  	}
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2218  =

d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2219  	/* ops.id should be DAMON_=
OPS_VADDR or DAMON_OPS_FVADDR */
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2220  	pid =3D find_get_pid(sys_t=
arget->pid);
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2221  	if (!pid)
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2222  		return ERR_PTR(-EINVAL);
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2223  	damon_for_each_target(t, c=
tx) {
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2224  		if (t->pid =3D=3D pid) {
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2225  			put_pid(pid);
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2226  			return t;
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2227  		}
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2228  	}
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2229  	put_pid(pid);
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2230  	return NULL;
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2231  }
d5d8b1d8bf2e2e4 SeongJae Park 2022-04-15  2232  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8858121890200912939==--

