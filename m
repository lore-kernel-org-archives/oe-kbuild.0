Content-Type: multipart/mixed; boundary="===============6786575400630908422=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/qmi.c:1891 ath11k_qmi_assign_target_mem_chunk() error: uninitialized symbol 'ret'.
Date: Thu, 27 Jan 2022 20:38:33 +0800
Message-ID: <202201272025.7AWXB5T7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6786575400630908422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 6ac04bdc5edb418787ab2040b1f922c23464c750 ath11k: Use reserved host =
DDR addresses from DT for PCI devices
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: microblaze-randconfig-m031-20220127 (https://download.01.org/0day-c=
i/archive/20220127/202201272025.7AWXB5T7-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/ath/ath11k/qmi.c:1891 ath11k_qmi_assign_target_mem_chu=
nk() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/net/wireless/ath/ath11k/qmi.c:2161 ath11k_qmi_load_file_target_mem(=
) error: uninitialized symbol 'ret'.

vim +/ret +1891 drivers/net/wireless/ath/ath11k/qmi.c

6eb6ea51382873 Govind Singh          2020-08-14  1875  =

6eb6ea51382873 Govind Singh          2020-08-14  1876  static int ath11k_qm=
i_assign_target_mem_chunk(struct ath11k_base *ab)
d5c65159f28953 Kalle Valo            2019-11-23  1877  {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1878  	struct device *dev =
=3D ab->dev;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1879  	struct device_node =
*hremote_node =3D NULL;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1880  	struct resource res;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1881  	u32 host_ddr_sz;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1882  	int i, idx, ret;
d5c65159f28953 Kalle Valo            2019-11-23  1883  =

d5c65159f28953 Kalle Valo            2019-11-23  1884  	for (i =3D 0, idx =
=3D 0; i < ab->qmi.mem_seg_count; i++) {
d5c65159f28953 Kalle Valo            2019-11-23  1885  		switch (ab->qmi.ta=
rget_mem[i].type) {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1886  		case HOST_DDR_REGI=
ON_TYPE:
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1887  			hremote_node =3D =
of_parse_phandle(dev->of_node, "memory-region", 0);
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1888  			if (!hremote_node=
) {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1889  				ath11k_dbg(ab, A=
TH11K_DBG_QMI,
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1890  					   "qmi fail to=
 get hremote_node\n");
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14 @1891  				return ret;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1892  			}
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1893  =

6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1894  			ret =3D of_addres=
s_to_resource(hremote_node, 0, &res);
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1895  			if (ret) {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1896  				ath11k_dbg(ab, A=
TH11K_DBG_QMI,
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1897  					   "qmi fail to=
 get reg from hremote\n");
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1898  				return ret;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1899  			}
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1900  =

6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1901  			if (res.end - res=
.start + 1 < ab->qmi.target_mem[i].size) {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1902  				ath11k_dbg(ab, A=
TH11K_DBG_QMI,
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1903  					   "qmi fail to=
 assign memory of sz\n");
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1904  				return -EINVAL;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1905  			}
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1906  =

6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1907  			ab->qmi.target_me=
m[idx].paddr =3D res.start;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1908  			ab->qmi.target_me=
m[idx].iaddr =3D
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1909  				ioremap(ab->qmi.=
target_mem[idx].paddr,
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1910  					ab->qmi.target_=
mem[i].size);
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1911  			ab->qmi.target_me=
m[idx].size =3D ab->qmi.target_mem[i].size;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1912  			host_ddr_sz =3D a=
b->qmi.target_mem[i].size;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1913  			ab->qmi.target_me=
m[idx].type =3D ab->qmi.target_mem[i].type;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1914  			idx++;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1915  			break;
d5c65159f28953 Kalle Valo            2019-11-23  1916  		case BDF_MEM_REGIO=
N_TYPE:
3b94ae4c62db0b Anilkumar Kolli       2020-06-16  1917  			ab->qmi.target_me=
m[idx].paddr =3D ab->hw_params.bdf_addr;
6eb6ea51382873 Govind Singh          2020-08-14  1918  			ab->qmi.target_me=
m[idx].vaddr =3D NULL;
d5c65159f28953 Kalle Valo            2019-11-23  1919  			ab->qmi.target_me=
m[idx].size =3D ab->qmi.target_mem[i].size;
d5c65159f28953 Kalle Valo            2019-11-23  1920  			ab->qmi.target_me=
m[idx].type =3D ab->qmi.target_mem[i].type;
d5c65159f28953 Kalle Valo            2019-11-23  1921  			idx++;
d5c65159f28953 Kalle Valo            2019-11-23  1922  			break;
d5c65159f28953 Kalle Valo            2019-11-23  1923  		case CALDB_MEM_REG=
ION_TYPE:
d5c65159f28953 Kalle Valo            2019-11-23  1924  			if (ab->qmi.targe=
t_mem[i].size > ATH11K_QMI_CALDB_SIZE) {
d5c65159f28953 Kalle Valo            2019-11-23  1925  				ath11k_warn(ab, =
"qmi mem size is low to load caldata\n");
d5c65159f28953 Kalle Valo            2019-11-23  1926  				return -EINVAL;
d5c65159f28953 Kalle Valo            2019-11-23  1927  			}
02f9d3c1b918a6 Govindaraj Saminathan 2020-10-16  1928  =

02f9d3c1b918a6 Govindaraj Saminathan 2020-10-16  1929  			if (ath11k_cold_b=
oot_cal && ab->hw_params.cold_boot_calib) {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1930  				if (hremote_node=
) {
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1931  					ab->qmi.target_=
mem[idx].paddr =3D
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1932  							res.start + h=
ost_ddr_sz;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1933  					ab->qmi.target_=
mem[idx].iaddr =3D
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1934  						ioremap(ab->qm=
i.target_mem[idx].paddr,
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1935  							ab->qmi.targe=
t_mem[i].size);
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1936  				} else {
02f9d3c1b918a6 Govindaraj Saminathan 2020-10-16  1937  					ab->qmi.target_=
mem[idx].paddr =3D
02f9d3c1b918a6 Govindaraj Saminathan 2020-10-16  1938  						ATH11K_QMI_CAL=
DB_ADDRESS;
6ac04bdc5edb41 Anilkumar Kolli       2021-12-14  1939  				}
02f9d3c1b918a6 Govindaraj Saminathan 2020-10-16  1940  			} else {
d5c65159f28953 Kalle Valo            2019-11-23  1941  				ab->qmi.target_m=
em[idx].paddr =3D 0;
6eb6ea51382873 Govind Singh          2020-08-14  1942  				ab->qmi.target_m=
em[idx].vaddr =3D NULL;
02f9d3c1b918a6 Govindaraj Saminathan 2020-10-16  1943  			}
d5c65159f28953 Kalle Valo            2019-11-23  1944  			ab->qmi.target_me=
m[idx].size =3D ab->qmi.target_mem[i].size;
d5c65159f28953 Kalle Valo            2019-11-23  1945  			ab->qmi.target_me=
m[idx].type =3D ab->qmi.target_mem[i].type;
d5c65159f28953 Kalle Valo            2019-11-23  1946  			idx++;
d5c65159f28953 Kalle Valo            2019-11-23  1947  			break;
d5c65159f28953 Kalle Valo            2019-11-23  1948  		default:
d5c65159f28953 Kalle Valo            2019-11-23  1949  			ath11k_warn(ab, "=
qmi ignore invalid mem req type %d\n",
d5c65159f28953 Kalle Valo            2019-11-23  1950  				    ab->qmi.targ=
et_mem[i].type);
d5c65159f28953 Kalle Valo            2019-11-23  1951  			break;
d5c65159f28953 Kalle Valo            2019-11-23  1952  		}
d5c65159f28953 Kalle Valo            2019-11-23  1953  	}
d5c65159f28953 Kalle Valo            2019-11-23  1954  	ab->qmi.mem_seg_cou=
nt =3D idx;
d5c65159f28953 Kalle Valo            2019-11-23  1955  =

d5c65159f28953 Kalle Valo            2019-11-23  1956  	return 0;
d5c65159f28953 Kalle Valo            2019-11-23  1957  }
d5c65159f28953 Kalle Valo            2019-11-23  1958  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6786575400630908422==--

