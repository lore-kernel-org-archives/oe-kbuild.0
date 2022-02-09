Content-Type: multipart/mixed; boundary="===============3088470218574224421=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 07/10] nvmet: add copy command support for bdev and file ns
Date: Thu, 10 Feb 2022 07:49:56 +0800
Message-ID: <202202100727.zZg2u4ow-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3088470218574224421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207141348.4235-8-nj.shetty@samsung.com>
References: <20220207141348.4235-8-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
TO: mpatocka(a)redhat.com
CC: javier(a)javigon.com
CC: chaitanyak(a)nvidia.com
CC: linux-block(a)vger.kernel.org
CC: linux-scsi(a)vger.kernel.org
CC: dm-devel(a)redhat.com
CC: linux-nvme(a)lists.infradead.org
CC: linux-fsdevel(a)vger.kernel.org
CC: axboe(a)kernel.dk
CC: msnitzer(a)redhat.com
CC: bvanassche(a)acm.org
CC: martin.petersen(a)oracle.com
CC: roland(a)purestorage.com
CC: hare(a)suse.de
CC: kbusch(a)kernel.org
CC: hch(a)lst.de
CC: Frederick.Knight(a)netapp.com
CC: zach.brown(a)ni.com
CC: osandov(a)fb.com
CC: lsf-pc(a)lists.linux-foundation.org
CC: djwong(a)kernel.org
CC: josef(a)toxicpanda.com
CC: clm(a)fb.com
CC: dsterba(a)suse.com
CC: tytso(a)mit.edu
CC: jack(a)suse.com
CC: joshi.k(a)samsung.com
CC: arnav.dawn(a)samsung.com
CC: nj.shetty(a)samsung.com

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[cannot apply to device-mapper-dm/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nitesh-Shetty/block-make-b=
io_map_kern-non-static/20220207-231407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220209 (https://download.01.org/0day-ci/arc=
hive/20220210/202202100727.zZg2u4ow-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6bb6ea64499e1ac27975e79bb=
2eee89f07861893
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nitesh-Shetty/block-make-bio_map_k=
ern-non-static/20220207-231407
        git checkout 6bb6ea64499e1ac27975e79bb2eee89f07861893
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
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
   12 warnings generated.
   drivers/nvme/target/io-cmd-file.c:377:11: warning: The right operand of =
'!=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
                   if (ret !=3D len) {
                           ^  ~~~
   drivers/nvme/target/io-cmd-file.c:356:15: note: 'len' declared without a=
n initial value
           int ret =3D 0, len, src, id;
                        ^~~
   drivers/nvme/target/io-cmd-file.c:360:15: note: Assuming the condition i=
s false
           if (unlikely(pos + req->transfer_len > req->ns->size)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/nvme/target/io-cmd-file.c:360:2: note: Taking false branch
           if (unlikely(pos + req->transfer_len > req->ns->size)) {
           ^
   drivers/nvme/target/io-cmd-file.c:365:16: note: 'id' is < 'nr_range'
           for (id =3D 0 ; id < nr_range; id++) {
                         ^~
   drivers/nvme/target/io-cmd-file.c:365:2: note: Loop condition is true.  =
Entering loop body
           for (id =3D 0 ; id < nr_range; id++) {
           ^
   drivers/nvme/target/io-cmd-file.c:370:7: note: Assuming 'ret' is not equ=
al to 0
                   if (ret)
                       ^~~
   drivers/nvme/target/io-cmd-file.c:370:3: note: Taking true branch
                   if (ret)
                   ^
   drivers/nvme/target/io-cmd-file.c:371:4: note: Control jumps to line 377
                           goto out;
                           ^
   drivers/nvme/target/io-cmd-file.c:377:11: note: The right operand of '!=
=3D' is a garbage value
                   if (ret !=3D len) {
                           ^  ~~~
>> drivers/nvme/target/io-cmd-file.c:378:4: warning: Value stored to 'pos' =
is never read [clang-analyzer-deadcode.DeadStores]
                           pos +=3D ret;
                           ^      ~~~
   drivers/nvme/target/io-cmd-file.c:378:4: note: Value stored to 'pos' is =
never read
                           pos +=3D ret;
                           ^      ~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/input/keyboard/lm8323.c:333:3: warning: Value stored to 'active'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   drivers/input/keyboard/lm8323.c:333:3: note: Value stored to 'active' is=
 never read
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   net/ipv6/ip6_vti.c:194:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(t->parms.name, dev->name);
           ^~~~~~
   net/ipv6/ip6_vti.c:194:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(t->parms.name, dev->name);
           ^~~~~~
   net/ipv6/ip6_vti.c:853:4: warning: Value stored to 'err' is never read [=
clang-analyzer-deadcode.DeadStores]
                           err =3D vti6_update(t, &p1, false);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_vti.c:853:4: note: Value stored to 'err' is never read
                           err =3D vti6_update(t, &p1, false);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_vti.c:1170:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(t->parms.name, ip6n->fb_tnl_dev->name);
           ^~~~~~
   net/ipv6/ip6_vti.c:1170:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(t->parms.name, ip6n->fb_tnl_dev->name);
           ^~~~~~
   net/ipv6/ip6_vti.c:1296:2: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
           err =3D xfrm6_tunnel_deregister(&vti_ip6ip_handler, AF_INET);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/ip6_vti.c:1296:2: note: Value stored to 'err' is never read
           err =3D xfrm6_tunnel_deregister(&vti_ip6ip_handler, AF_INET);

vim +/pos +378 drivers/nvme/target/io-cmd-file.c

d5eff33ee6f808 Chaitanya Kulkarni 2018-05-23  349  =

6bb6ea64499e1a Arnav Dawn         2022-02-07  350  static void nvmet_file_c=
opy_work(struct work_struct *w)
6bb6ea64499e1a Arnav Dawn         2022-02-07  351  {
6bb6ea64499e1a Arnav Dawn         2022-02-07  352  	struct nvmet_req *req =
=3D container_of(w, struct nvmet_req, f.work);
6bb6ea64499e1a Arnav Dawn         2022-02-07  353  	int nr_range;
6bb6ea64499e1a Arnav Dawn         2022-02-07  354  	loff_t pos;
6bb6ea64499e1a Arnav Dawn         2022-02-07  355  	struct nvme_command *cm=
nd =3D req->cmd;
6bb6ea64499e1a Arnav Dawn         2022-02-07  356  	int ret =3D 0, len, src=
, id;
6bb6ea64499e1a Arnav Dawn         2022-02-07  357  =

6bb6ea64499e1a Arnav Dawn         2022-02-07  358  	nr_range =3D cmnd->copy=
.nr_range + 1;
6bb6ea64499e1a Arnav Dawn         2022-02-07  359  	pos =3D le64_to_cpu(req=
->cmd->copy.sdlba) << req->ns->blksize_shift;
6bb6ea64499e1a Arnav Dawn         2022-02-07  360  	if (unlikely(pos + req-=
>transfer_len > req->ns->size)) {
6bb6ea64499e1a Arnav Dawn         2022-02-07  361  		nvmet_req_complete(req=
, errno_to_nvme_status(req, -ENOSPC));
6bb6ea64499e1a Arnav Dawn         2022-02-07  362  		return;
6bb6ea64499e1a Arnav Dawn         2022-02-07  363  	}
6bb6ea64499e1a Arnav Dawn         2022-02-07  364  =

6bb6ea64499e1a Arnav Dawn         2022-02-07  365  	for (id =3D 0 ; id < nr=
_range; id++) {
6bb6ea64499e1a Arnav Dawn         2022-02-07  366  		struct nvme_copy_range=
 range;
6bb6ea64499e1a Arnav Dawn         2022-02-07  367  =

6bb6ea64499e1a Arnav Dawn         2022-02-07  368  		ret =3D nvmet_copy_fro=
m_sgl(req, id * sizeof(range), &range,
6bb6ea64499e1a Arnav Dawn         2022-02-07  369  					sizeof(range));
6bb6ea64499e1a Arnav Dawn         2022-02-07  370  		if (ret)
6bb6ea64499e1a Arnav Dawn         2022-02-07  371  			goto out;
6bb6ea64499e1a Arnav Dawn         2022-02-07  372  =

6bb6ea64499e1a Arnav Dawn         2022-02-07  373  		len =3D (le16_to_cpu(r=
ange.nlb) + 1) << (req->ns->blksize_shift);
6bb6ea64499e1a Arnav Dawn         2022-02-07  374  		src =3D (le64_to_cpu(r=
ange.slba) << (req->ns->blksize_shift));
6bb6ea64499e1a Arnav Dawn         2022-02-07  375  		ret =3D vfs_copy_file_=
range(req->ns->file, src, req->ns->file, pos, len, 0);
6bb6ea64499e1a Arnav Dawn         2022-02-07  376  out:
6bb6ea64499e1a Arnav Dawn         2022-02-07  377  		if (ret !=3D len) {
6bb6ea64499e1a Arnav Dawn         2022-02-07 @378  			pos +=3D ret;
6bb6ea64499e1a Arnav Dawn         2022-02-07  379  			req->cqe->result.u32 =
=3D cpu_to_le32(id);
6bb6ea64499e1a Arnav Dawn         2022-02-07  380  			nvmet_req_complete(re=
q, ret < 0 ? errno_to_nvme_status(req, ret) :
6bb6ea64499e1a Arnav Dawn         2022-02-07  381  					errno_to_nvme_statu=
s(req, -EIO));
6bb6ea64499e1a Arnav Dawn         2022-02-07  382  			return;
6bb6ea64499e1a Arnav Dawn         2022-02-07  383  =

6bb6ea64499e1a Arnav Dawn         2022-02-07  384  		} else
6bb6ea64499e1a Arnav Dawn         2022-02-07  385  			pos +=3D len;
6bb6ea64499e1a Arnav Dawn         2022-02-07  386  }
6bb6ea64499e1a Arnav Dawn         2022-02-07  387  	nvmet_req_complete(req,=
 ret);
6bb6ea64499e1a Arnav Dawn         2022-02-07  388  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3088470218574224421==--

