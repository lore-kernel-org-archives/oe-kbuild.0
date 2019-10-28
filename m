Content-Type: multipart/mixed; boundary="===============4509119619621610907=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-review:UPDATE-20191027-161609/Michal-Suchanek/Fix-cdrom-autoclose/20191025-101637 7/8] drivers/scsi/scsi_devinfo.c:458 scsi_dev_info_list_find() warn: add some parenthesis here?
Date: Mon, 28 Oct 2019 09:16:51 +0300
Message-ID: <20191028061651.GB1922@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4509119619621610907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20191027-161609/Mic=
hal-Suchanek/Fix-cdrom-autoclose/20191025-101637
head:   8ebc37a465cccfa1f297f976e1bd8b36ede36db3
commit: 6bb0f3478cfa38409ec750b5c99dda95acf6fdc8 [7/8] scsi: blacklist: add=
 VMware ESXi cdrom - broken tray emulation.

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/scsi_devinfo.c:458 scsi_dev_info_list_find() warn: add some pa=
renthesis here?
drivers/scsi/scsi_devinfo.c:458 scsi_dev_info_list_find() warn: maybe use &=
& instead of &

# https://github.com/0day-ci/linux/commit/6bb0f3478cfa38409ec750b5c99dda95a=
cf6fdc8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 6bb0f3478cfa38409ec750b5c99dda95acf6fdc8
vim +458 drivers/scsi/scsi_devinfo.c

c42b3654f48bc0 Alan Stern      2015-08-03  411  static struct scsi_dev_info=
_list *scsi_dev_info_list_find(const char *vendor,
4b1d8e78615d1a Bart Van Assche 2017-12-04  412  		const char *model, enum s=
csi_devinfo_key key)
38a039be2e7bda Peter Jones     2011-01-06  413  {
c42b3654f48bc0 Alan Stern      2015-08-03  414  	struct scsi_dev_info_list =
*devinfo;
38a039be2e7bda Peter Jones     2011-01-06  415  	struct scsi_dev_info_list_=
table *devinfo_table =3D
38a039be2e7bda Peter Jones     2011-01-06  416  		scsi_devinfo_lookup_by_ke=
y(key);
b8018b973c7cef Hannes Reinecke 2017-10-02  417  	size_t vmax, mmax, mlen;
b704f70ce2003c Alan Stern      2015-08-03  418  	const char *vskip, *mskip;
38a039be2e7bda Peter Jones     2011-01-06  419  =

38a039be2e7bda Peter Jones     2011-01-06  420  	if (IS_ERR(devinfo_table))
c42b3654f48bc0 Alan Stern      2015-08-03  421  		return (struct scsi_dev_i=
nfo_list *) devinfo_table;
38a039be2e7bda Peter Jones     2011-01-06  422  =

b704f70ce2003c Alan Stern      2015-08-03  423  	/* Prepare for "compatible=
" matches */
b704f70ce2003c Alan Stern      2015-08-03  424  =

38a039be2e7bda Peter Jones     2011-01-06  425  	/*
38a039be2e7bda Peter Jones     2011-01-06  426  	 * XXX why skip leading sp=
aces? If an odd INQUIRY
38a039be2e7bda Peter Jones     2011-01-06  427  	 * value, that should have=
 been part of the
38a039be2e7bda Peter Jones     2011-01-06  428  	 * scsi_static_device_list=
[] entry, such as "  FOO"
38a039be2e7bda Peter Jones     2011-01-06  429  	 * rather than "FOO". Sinc=
e this code is already
38a039be2e7bda Peter Jones     2011-01-06  430  	 * here, and we don't know=
 what device it is
38a039be2e7bda Peter Jones     2011-01-06  431  	 * trying to work with, le=
ave it as-is.
38a039be2e7bda Peter Jones     2011-01-06  432  	 */
5e7ff2ca7f2da5 Alan Stern      2016-06-23  433  	vmax =3D sizeof(devinfo->v=
endor);
b704f70ce2003c Alan Stern      2015-08-03  434  	vskip =3D vendor;
b704f70ce2003c Alan Stern      2015-08-03  435  	while (vmax > 0 && *vskip =
=3D=3D ' ') {
b704f70ce2003c Alan Stern      2015-08-03  436  		vmax--;
b704f70ce2003c Alan Stern      2015-08-03  437  		vskip++;
b704f70ce2003c Alan Stern      2015-08-03  438  	}
b704f70ce2003c Alan Stern      2015-08-03  439  	/* Also skip trailing spac=
es */
b704f70ce2003c Alan Stern      2015-08-03  440  	while (vmax > 0 && vskip[v=
max - 1] =3D=3D ' ')
b704f70ce2003c Alan Stern      2015-08-03  441  		--vmax;
b704f70ce2003c Alan Stern      2015-08-03  442  =

5e7ff2ca7f2da5 Alan Stern      2016-06-23  443  	mmax =3D sizeof(devinfo->m=
odel);
b704f70ce2003c Alan Stern      2015-08-03  444  	mskip =3D model;
b704f70ce2003c Alan Stern      2015-08-03  445  	while (mmax > 0 && *mskip =
=3D=3D ' ') {
b704f70ce2003c Alan Stern      2015-08-03  446  		mmax--;
b704f70ce2003c Alan Stern      2015-08-03  447  		mskip++;
38a039be2e7bda Peter Jones     2011-01-06  448  	}
b704f70ce2003c Alan Stern      2015-08-03  449  	while (mmax > 0 && mskip[m=
max - 1] =3D=3D ' ')
b704f70ce2003c Alan Stern      2015-08-03  450  		--mmax;
b704f70ce2003c Alan Stern      2015-08-03  451  =

b704f70ce2003c Alan Stern      2015-08-03  452  	list_for_each_entry(devinf=
o, &devinfo_table->scsi_dev_info_list,
b704f70ce2003c Alan Stern      2015-08-03  453  			    dev_info_list) {
b704f70ce2003c Alan Stern      2015-08-03  454  		if (devinfo->compatible) {
38a039be2e7bda Peter Jones     2011-01-06  455  			/*
b8018b973c7cef Hannes Reinecke 2017-10-02  456  			 * vendor strings must b=
e an exact match
38a039be2e7bda Peter Jones     2011-01-06  457  			 */
6bb0f3478cfa38 Michal Suchanek 2019-10-24 @458  			if (!devinfo->flags & BL=
IST_MATCH_VENDOR)
                                                                           =
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is a precedence bug because ! is higher precedence than &.  It
should be:

	if (!(devinfo->flags & BLIST_MATCH_VENDOR))

ba69ead9e9e9bb Martin Wilck    2017-11-27  459  				if (vmax !=3D strnlen(d=
evinfo->vendor,
ba69ead9e9e9bb Martin Wilck    2017-11-27  460  						    sizeof(devinfo->v=
endor)) ||
b8018b973c7cef Hannes Reinecke 2017-10-02  461  				    memcmp(devinfo->ven=
dor, vskip, vmax))
38a039be2e7bda Peter Jones     2011-01-06  462  					continue;
b8018b973c7cef Hannes Reinecke 2017-10-02  463  =

b8018b973c7cef Hannes Reinecke 2017-10-02  464  			/*

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============4509119619621610907==--

