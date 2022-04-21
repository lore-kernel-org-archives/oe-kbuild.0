Content-Type: multipart/mixed; boundary="===============5053682740258703083=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/qmi.c:2031 ath11k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.
Date: Thu, 21 Apr 2022 15:28:08 +0800
Message-ID: <202204211519.wpw4Zz0V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5053682740258703083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: Jouni Malinen <jouni@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: 336e7b53c82fc74d261024773a0fab43623a94fb ath11k: clean up BDF downl=
oad functions
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220421/202204211519.wpw4Zz0V-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/qmi.c:2031 ath11k_qmi_load_file_target_mem(=
) error: uninitialized symbol 'ret'.

vim +/ret +2031 drivers/net/wireless/ath/ath11k/qmi.c

d5c65159f289537 Kalle Valo      2019-11-23  1919  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1920  static int ath11k_qmi_loa=
d_file_target_mem(struct ath11k_base *ab,
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1921  					   const u8 *data, u=
32 len, u8 type)
d5c65159f289537 Kalle Valo      2019-11-23  1922  {
d5c65159f289537 Kalle Valo      2019-11-23  1923  	struct qmi_wlanfw_bdf_do=
wnload_req_msg_v01 *req;
d5c65159f289537 Kalle Valo      2019-11-23  1924  	struct qmi_wlanfw_bdf_do=
wnload_resp_msg_v01 resp;
d5c65159f289537 Kalle Valo      2019-11-23  1925  	struct qmi_txn txn =3D {=
};
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1926  	const u8 *temp =3D data;
d5c65159f289537 Kalle Valo      2019-11-23  1927  	void __iomem *bdf_addr =
=3D NULL;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1928  	int ret;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1929  	u32 remaining =3D len;
d5c65159f289537 Kalle Valo      2019-11-23  1930  =

d5c65159f289537 Kalle Valo      2019-11-23  1931  	req =3D kzalloc(sizeof(*=
req), GFP_KERNEL);
d5c65159f289537 Kalle Valo      2019-11-23  1932  	if (!req)
d5c65159f289537 Kalle Valo      2019-11-23  1933  		return -ENOMEM;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1934  =

d5c65159f289537 Kalle Valo      2019-11-23  1935  	memset(&resp, 0, sizeof(=
resp));
d5c65159f289537 Kalle Valo      2019-11-23  1936  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1937  	if (ab->bus_params.fixed=
_bdf_addr) {
c72aa32d6d1c04f Anilkumar Kolli 2021-09-28  1938  		bdf_addr =3D ioremap(ab=
->hw_params.bdf_addr, ab->hw_params.fw.board_size);
d5c65159f289537 Kalle Valo      2019-11-23  1939  		if (!bdf_addr) {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1940  			ath11k_warn(ab, "qmi i=
oremap error for bdf_addr\n");
d5c65159f289537 Kalle Valo      2019-11-23  1941  			ret =3D -EIO;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1942  			goto err_free_req;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1943  		}
d5c65159f289537 Kalle Valo      2019-11-23  1944  	}
d5c65159f289537 Kalle Valo      2019-11-23  1945  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1946  	while (remaining) {
d5c65159f289537 Kalle Valo      2019-11-23  1947  		req->valid =3D 1;
d5c65159f289537 Kalle Valo      2019-11-23  1948  		req->file_id_valid =3D =
1;
d5c65159f289537 Kalle Valo      2019-11-23  1949  		req->file_id =3D ab->qm=
i.target.board_id;
d5c65159f289537 Kalle Valo      2019-11-23  1950  		req->total_size_valid =
=3D 1;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1951  		req->total_size =3D rem=
aining;
d5c65159f289537 Kalle Valo      2019-11-23  1952  		req->seg_id_valid =3D 1;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1953  		req->data_valid =3D 1;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1954  		req->bdf_type =3D type;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1955  		req->bdf_type_valid =3D=
 1;
d5c65159f289537 Kalle Valo      2019-11-23  1956  		req->end_valid =3D 1;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1957  		req->end =3D 0;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1958  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1959  		if (remaining > QMI_WLA=
NFW_MAX_DATA_SIZE_V01) {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1960  			req->data_len =3D QMI_=
WLANFW_MAX_DATA_SIZE_V01;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1961  		} else {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1962  			req->data_len =3D rema=
ining;
d5c65159f289537 Kalle Valo      2019-11-23  1963  			req->end =3D 1;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1964  		}
d5c65159f289537 Kalle Valo      2019-11-23  1965  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1966  		if (ab->bus_params.fixe=
d_bdf_addr) {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1967  			req->data_valid =3D 0;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1968  			req->end =3D 1;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1969  			req->data_len =3D ATH1=
1K_QMI_MAX_BDF_FILE_NAME_SIZE;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1970  		} else {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1971  			memcpy(req->data, temp=
, req->data_len);
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1972  		}
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1973  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1974  		if (ab->bus_params.fixe=
d_bdf_addr) {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1975  			if (type =3D=3D ATH11K=
_QMI_FILE_TYPE_CALDATA)
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1976  				bdf_addr +=3D ab->hw_=
params.fw.cal_offset;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1977  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1978  			memcpy_toio(bdf_addr, =
temp, len);
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1979  		}
d5c65159f289537 Kalle Valo      2019-11-23  1980  =

d5c65159f289537 Kalle Valo      2019-11-23  1981  		ret =3D qmi_txn_init(&a=
b->qmi.handle, &txn,
d5c65159f289537 Kalle Valo      2019-11-23  1982  				   qmi_wlanfw_bdf_dow=
nload_resp_msg_v01_ei,
d5c65159f289537 Kalle Valo      2019-11-23  1983  				   &resp);
d5c65159f289537 Kalle Valo      2019-11-23  1984  		if (ret < 0)
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1985  			goto err_iounmap;
d5c65159f289537 Kalle Valo      2019-11-23  1986  =

bf458d79cfc46f7 Kalle Valo      2021-02-22  1987  		ath11k_dbg(ab, ATH11K_D=
BG_QMI, "qmi bdf download req fixed addr type %d\n",
bf458d79cfc46f7 Kalle Valo      2021-02-22  1988  			   type);
bf458d79cfc46f7 Kalle Valo      2021-02-22  1989  =

d5c65159f289537 Kalle Valo      2019-11-23  1990  		ret =3D qmi_send_reques=
t(&ab->qmi.handle, NULL, &txn,
d5c65159f289537 Kalle Valo      2019-11-23  1991  				       QMI_WLANFW_BDF=
_DOWNLOAD_REQ_V01,
d5c65159f289537 Kalle Valo      2019-11-23  1992  				       QMI_WLANFW_BDF=
_DOWNLOAD_REQ_MSG_V01_MAX_LEN,
d5c65159f289537 Kalle Valo      2019-11-23  1993  				       qmi_wlanfw_bdf=
_download_req_msg_v01_ei, req);
d5c65159f289537 Kalle Valo      2019-11-23  1994  		if (ret < 0) {
d5c65159f289537 Kalle Valo      2019-11-23  1995  			qmi_txn_cancel(&txn);
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  1996  			goto err_iounmap;
d5c65159f289537 Kalle Valo      2019-11-23  1997  		}
d5c65159f289537 Kalle Valo      2019-11-23  1998  =

d5c65159f289537 Kalle Valo      2019-11-23  1999  		ret =3D qmi_txn_wait(&t=
xn, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2000  		if (ret < 0) {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2001  			ath11k_warn(ab, "faile=
d to wait board file download request: %d\n",
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2002  				    ret);
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2003  			goto err_iounmap;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2004  		}
d5c65159f289537 Kalle Valo      2019-11-23  2005  =

d5c65159f289537 Kalle Valo      2019-11-23  2006  		if (resp.resp.result !=
=3D QMI_RESULT_SUCCESS_V01) {
097e9f0714555e5 Kalle Valo      2021-02-22  2007  			ath11k_warn(ab, "board=
 file download request failed: %d %d\n",
d5c65159f289537 Kalle Valo      2019-11-23  2008  				    resp.resp.result,=
 resp.resp.error);
d5c65159f289537 Kalle Valo      2019-11-23  2009  			ret =3D -EINVAL;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2010  			goto err_iounmap;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2011  		}
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2012  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2013  		if (ab->bus_params.fixe=
d_bdf_addr) {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2014  			remaining =3D 0;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2015  		} else {
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2016  			remaining -=3D req->da=
ta_len;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2017  			temp +=3D req->data_le=
n;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2018  			req->seg_id++;
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2019  			ath11k_dbg(ab, ATH11K_=
DBG_QMI, "qmi bdf download request remaining %i\n",
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2020  				   remaining);
d5c65159f289537 Kalle Valo      2019-11-23  2021  		}
d5c65159f289537 Kalle Valo      2019-11-23  2022  	}
d5c65159f289537 Kalle Valo      2019-11-23  2023  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2024  err_iounmap:
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2025  	if (ab->bus_params.fixed=
_bdf_addr)
d5c65159f289537 Kalle Valo      2019-11-23  2026  		iounmap(bdf_addr);
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2027  =

336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2028  err_free_req:
d5c65159f289537 Kalle Valo      2019-11-23  2029  	kfree(req);
336e7b53c82fc74 Anilkumar Kolli 2021-09-28  2030  =

d5c65159f289537 Kalle Valo      2019-11-23 @2031  	return ret;
d5c65159f289537 Kalle Valo      2019-11-23  2032  }
d5c65159f289537 Kalle Valo      2019-11-23  2033  =


:::::: The code at line 2031 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5053682740258703083==--

