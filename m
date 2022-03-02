Content-Type: multipart/mixed; boundary="===============3176490228447571581=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:195 core_link_read_dpcd() error: uninitialized symbol 'status'.
Date: Wed, 02 Mar 2022 10:51:55 +0800
Message-ID: <202203020851.QyiQLhsL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3176490228447571581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wesley Chalmers <Wesley.Chalmers@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jun Lei <Jun.Lei@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   575115360652e9920cc56a028a286ebe9bf82694
commit: 9cf9498f668d4c78616ebd2fe2e5f3850b189c5b drm/amd/display: Partition=
 DPCD address space and break up transactions
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-m031-20220301 (https://download.01.org/0day-ci/a=
rchive/20220302/202203020851.QyiQLhsL-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:195 core_link_=
read_dpcd() error: uninitialized symbol 'status'.
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:217 core_link_=
write_dpcd() error: uninitialized symbol 'status'.

vim +/status +195 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpc=
d.c

30adeee52d1eba Wesley Chalmers 2021-04-01  164  =

30adeee52d1eba Wesley Chalmers 2021-04-01  165  enum dc_status core_link_re=
ad_dpcd(
30adeee52d1eba Wesley Chalmers 2021-04-01  166  	struct dc_link *link,
30adeee52d1eba Wesley Chalmers 2021-04-01  167  	uint32_t address,
30adeee52d1eba Wesley Chalmers 2021-04-01  168  	uint8_t *data,
30adeee52d1eba Wesley Chalmers 2021-04-01  169  	uint32_t size)
30adeee52d1eba Wesley Chalmers 2021-04-01  170  {
30adeee52d1eba Wesley Chalmers 2021-04-01  171  	uint32_t extended_address;
9cf9498f668d4c Wesley Chalmers 2021-04-08  172  	uint32_t partitioned_addre=
ss;
30adeee52d1eba Wesley Chalmers 2021-04-01  173  	uint8_t *extended_data;
30adeee52d1eba Wesley Chalmers 2021-04-01  174  	uint32_t extended_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  175  	/* size of the remaining p=
artitioned address space */
9cf9498f668d4c Wesley Chalmers 2021-04-08  176  	uint32_t size_left_to_read;
30adeee52d1eba Wesley Chalmers 2021-04-01  177  	enum dc_status status;
9cf9498f668d4c Wesley Chalmers 2021-04-08  178  	/* size of the next partit=
ion to be read from */
9cf9498f668d4c Wesley Chalmers 2021-04-08  179  	uint32_t partition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  180  	uint32_t data_index =3D 0;
30adeee52d1eba Wesley Chalmers 2021-04-01  181  =

30adeee52d1eba Wesley Chalmers 2021-04-01  182  	dpcd_extend_address_range(=
address, data, size, &extended_address, &extended_data, &extended_size);
9cf9498f668d4c Wesley Chalmers 2021-04-08  183  	partitioned_address =3D ex=
tended_address;
9cf9498f668d4c Wesley Chalmers 2021-04-08  184  	size_left_to_read =3D exte=
nded_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  185  	while (size_left_to_read) {
9cf9498f668d4c Wesley Chalmers 2021-04-08  186  		partition_size =3D dpcd_g=
et_next_partition_size(partitioned_address, size_left_to_read);
9cf9498f668d4c Wesley Chalmers 2021-04-08  187  		status =3D internal_link_=
read_dpcd(link, partitioned_address, &extended_data[data_index], partition_=
size);
9cf9498f668d4c Wesley Chalmers 2021-04-08  188  		if (status !=3D DC_OK)
9cf9498f668d4c Wesley Chalmers 2021-04-08  189  			break;
9cf9498f668d4c Wesley Chalmers 2021-04-08  190  		partitioned_address +=3D =
partition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  191  		data_index +=3D partition=
_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  192  		size_left_to_read -=3D pa=
rtition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  193  	}
30adeee52d1eba Wesley Chalmers 2021-04-01  194  	dpcd_reduce_address_range(=
extended_address, extended_data, extended_size, address, data, size);
30adeee52d1eba Wesley Chalmers 2021-04-01 @195  	return status;
30adeee52d1eba Wesley Chalmers 2021-04-01  196  }
30adeee52d1eba Wesley Chalmers 2021-04-01  197  =

30adeee52d1eba Wesley Chalmers 2021-04-01  198  enum dc_status core_link_wr=
ite_dpcd(
30adeee52d1eba Wesley Chalmers 2021-04-01  199  	struct dc_link *link,
30adeee52d1eba Wesley Chalmers 2021-04-01  200  	uint32_t address,
30adeee52d1eba Wesley Chalmers 2021-04-01  201  	const uint8_t *data,
30adeee52d1eba Wesley Chalmers 2021-04-01  202  	uint32_t size)
30adeee52d1eba Wesley Chalmers 2021-04-01  203  {
9cf9498f668d4c Wesley Chalmers 2021-04-08  204  	uint32_t partition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  205  	uint32_t data_index =3D 0;
9cf9498f668d4c Wesley Chalmers 2021-04-08  206  	enum dc_status status;
9cf9498f668d4c Wesley Chalmers 2021-04-08  207  =

9cf9498f668d4c Wesley Chalmers 2021-04-08  208  	while (size) {
9cf9498f668d4c Wesley Chalmers 2021-04-08  209  		partition_size =3D dpcd_g=
et_next_partition_size(address, size);
9cf9498f668d4c Wesley Chalmers 2021-04-08  210  		status =3D internal_link_=
write_dpcd(link, address, &data[data_index], partition_size);
9cf9498f668d4c Wesley Chalmers 2021-04-08  211  		if (status !=3D DC_OK)
9cf9498f668d4c Wesley Chalmers 2021-04-08  212  			break;
9cf9498f668d4c Wesley Chalmers 2021-04-08  213  		address +=3D partition_si=
ze;
9cf9498f668d4c Wesley Chalmers 2021-04-08  214  		data_index +=3D partition=
_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  215  		size -=3D partition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  216  	}
9cf9498f668d4c Wesley Chalmers 2021-04-08 @217  	return status;

:::::: The code at line 195 was first introduced by commit
:::::: 30adeee52d1ebadd8e4e594a54c7cf77250b91db drm/amd/display: Enforce DP=
CD Address ranges

:::::: TO: Wesley Chalmers <Wesley.Chalmers@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3176490228447571581==--

