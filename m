Content-Type: multipart/mixed; boundary="===============1939386228496296095=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 3/4] SFH: Transport Driver to add support of AMD sensor fusion Hub (SFH)
Date: Mon, 13 Jan 2020 13:45:10 +0300
Message-ID: <20200113104510.GD9488@kadam>
In-Reply-To: <1578558528-10108-1-git-send-email-Sandeep.Singh@amd.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1939386228496296095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sandeep,

url:    https://github.com/0day-ci/linux/commits/Sandeep-Singh/SFH-Add-Supp=
ort-for-AMD-Sensor-Fusion-Hub/20200110-084435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b07f636fca1c8fbba124b0082487c0b3890a0e0c

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hid/amd-sfh-hid/amdsfh-hid-client.c:157 amd_sfh_hid_client_probe() =
warn: possible memory leak of 'cl_dev'
drivers/hid/amd-sfh-hid/amdsfh-hid-client.c:225 amd_sfh_hid_client_remove()=
 warn: variable dereferenced before check 'cl_dev' (see line 218)
drivers/hid/amd-sfh-hid/amdsfh-hid-client.c:225 amd_sfh_hid_client_remove()=
 warn: variable dereferenced before check 'cl_data' (see line 220)
drivers/hid/amd-sfh-hid/amdsfh-debugfs.c:42 amdsfh_debugfs_accel_read() war=
n: possible memory leak of 'obuf'
drivers/hid/amd-sfh-hid/amdsfh-debugfs.c:78 amdsfh_debugfs_gyro_read() warn=
: possible memory leak of 'obuf'
drivers/hid/amd-sfh-hid/amdsfh-debugfs.c:114 amdsfh_debugfs_mag_read() warn=
: possible memory leak of 'obuf'
drivers/hid/amd-sfh-hid/amdsfh-debugfs.c:150 amdsfh_debugfs_als_read() warn=
: possible memory leak of 'obuf'

# https://github.com/0day-ci/linux/commit/da2b6403065dd09f90ffdd06c25cbc139=
acde2b8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout da2b6403065dd09f90ffdd06c25cbc139acde2b8
vim +/cl_dev +157 drivers/hid/amd-sfh-hid/amdsfh-hid-client.c

da2b6403065dd0 Sandeep Singh 2020-01-09  140  static int amd_sfh_hid_client=
_probe(struct platform_device *pdev)
da2b6403065dd0 Sandeep Singh 2020-01-09  141  {
da2b6403065dd0 Sandeep Singh 2020-01-09  142  	struct amd_mp2_sensor_info i=
nfo;
da2b6403065dd0 Sandeep Singh 2020-01-09  143  	int rc =3D 0;
da2b6403065dd0 Sandeep Singh 2020-01-09  144  	int i;
da2b6403065dd0 Sandeep Singh 2020-01-09  145  	struct amdtp_cl_device *cl_d=
ev;
da2b6403065dd0 Sandeep Singh 2020-01-09  146  	struct amdtp_cl_data *cl_dat=
a;
da2b6403065dd0 Sandeep Singh 2020-01-09  147  	u32 feature_report_size =3D =
0;
da2b6403065dd0 Sandeep Singh 2020-01-09  148  	u32 input_report_size =3D 0;
da2b6403065dd0 Sandeep Singh 2020-01-09  149  =

da2b6403065dd0 Sandeep Singh 2020-01-09  150  	cl_dev =3D kzalloc(sizeof(*c=
l_dev), GFP_KERNEL);
da2b6403065dd0 Sandeep Singh 2020-01-09  151  	if (!cl_dev)
da2b6403065dd0 Sandeep Singh 2020-01-09  152  		return -ENOMEM;
da2b6403065dd0 Sandeep Singh 2020-01-09  153  =

da2b6403065dd0 Sandeep Singh 2020-01-09  154  	cl_dev->pdev =3D pci_get_dev=
ice(PCI_VENDOR_ID_AMD,
da2b6403065dd0 Sandeep Singh 2020-01-09  155  				      PCI_DEVICE_ID_AMD_M=
P2, NULL);
da2b6403065dd0 Sandeep Singh 2020-01-09  156  	if (!cl_dev->pdev)
da2b6403065dd0 Sandeep Singh 2020-01-09 @157  		return -ENOMEM;
                                                        ^^^^^^^^^^^^^^
You might want to consider using devm_kzalloc().

da2b6403065dd0 Sandeep Singh 2020-01-09  158  =

da2b6403065dd0 Sandeep Singh 2020-01-09  159  	cl_data =3D kzalloc(sizeof(*=
cl_data), GFP_KERNEL);
da2b6403065dd0 Sandeep Singh 2020-01-09  160  	cl_data->num_hid_devices =3D=
 amd_mp2_get_sensor_num
da2b6403065dd0 Sandeep Singh 2020-01-09  161  				   (cl_dev->pdev, &cl_dat=
a->sensor_idx[0]);
da2b6403065dd0 Sandeep Singh 2020-01-09  162  =

da2b6403065dd0 Sandeep Singh 2020-01-09  163  	INIT_DELAYED_WORK(&cl_data->=
work, amd_sfh_work);
da2b6403065dd0 Sandeep Singh 2020-01-09  164  	INIT_DELAYED_WORK(&cl_data->=
work_buffer, amd_sfh_work_buffer);
da2b6403065dd0 Sandeep Singh 2020-01-09  165  	INIT_LIST_HEAD(&req_list.lis=
t);
da2b6403065dd0 Sandeep Singh 2020-01-09  166  =

da2b6403065dd0 Sandeep Singh 2020-01-09  167  	amdsfh_debugfs_setup(cl_data=
);
da2b6403065dd0 Sandeep Singh 2020-01-09  168  =

da2b6403065dd0 Sandeep Singh 2020-01-09  169  	for (i =3D 0; i < cl_data->n=
um_hid_devices; i++) {
da2b6403065dd0 Sandeep Singh 2020-01-09  170  		cl_data->sensor_virt_addr[i=
] =3D dma_alloc_coherent
da2b6403065dd0 Sandeep Singh 2020-01-09  171  			(&pdev->dev, sizeof(int) *=
 8,
da2b6403065dd0 Sandeep Singh 2020-01-09  172  			&cl_data->sensor_phy_addr[=
i], GFP_KERNEL);
da2b6403065dd0 Sandeep Singh 2020-01-09  173  		cl_data->sensor_sts[i] =3D =
0;
da2b6403065dd0 Sandeep Singh 2020-01-09  174  		cl_data->sensor_requested_c=
nt[i] =3D 0;
da2b6403065dd0 Sandeep Singh 2020-01-09  175  		cl_data->cur_hid_dev =3D i;
da2b6403065dd0 Sandeep Singh 2020-01-09  176  =

da2b6403065dd0 Sandeep Singh 2020-01-09  177  		cl_data->report_descr_size[=
i] =3D get_descriptor_size
da2b6403065dd0 Sandeep Singh 2020-01-09  178  				(cl_data->sensor_idx[i], =
descr_size);
da2b6403065dd0 Sandeep Singh 2020-01-09  179  =

da2b6403065dd0 Sandeep Singh 2020-01-09  180  		feature_report_size =3D get=
_descriptor_size
da2b6403065dd0 Sandeep Singh 2020-01-09  181  				(cl_data->sensor_idx[i], =
feature_size);
da2b6403065dd0 Sandeep Singh 2020-01-09  182  =

da2b6403065dd0 Sandeep Singh 2020-01-09  183  		input_report_size =3D  get_=
descriptor_size
da2b6403065dd0 Sandeep Singh 2020-01-09  184  			(cl_data->sensor_idx[i], i=
nput_size);
da2b6403065dd0 Sandeep Singh 2020-01-09  185  =

da2b6403065dd0 Sandeep Singh 2020-01-09  186  		cl_data->feature_report[i] =
=3D kzalloc(feature_report_size,
da2b6403065dd0 Sandeep Singh 2020-01-09  187  						     GFP_KERNEL);
da2b6403065dd0 Sandeep Singh 2020-01-09  188  		cl_data->input_report[i] =
=3D kzalloc(input_report_size,
da2b6403065dd0 Sandeep Singh 2020-01-09  189  						   GFP_KERNEL);
da2b6403065dd0 Sandeep Singh 2020-01-09  190  		info.period =3D PERIOD;
da2b6403065dd0 Sandeep Singh 2020-01-09  191  		info.sensor_idx =3D cl_data=
->sensor_idx[i];
da2b6403065dd0 Sandeep Singh 2020-01-09  192  		info.phy_address =3D cl_dat=
a->sensor_phy_addr[i];
da2b6403065dd0 Sandeep Singh 2020-01-09  193  		cl_data->report_descr[i] =
=3D kzalloc
da2b6403065dd0 Sandeep Singh 2020-01-09  194  			(cl_data->report_descr_siz=
e[i], GFP_KERNEL);
da2b6403065dd0 Sandeep Singh 2020-01-09  195  		if (!cl_data->report_descr[=
i])
da2b6403065dd0 Sandeep Singh 2020-01-09  196  			return -ENOMEM;
da2b6403065dd0 Sandeep Singh 2020-01-09  197  		rc =3D get_report_descripto=
r(cl_data->sensor_idx[i],
da2b6403065dd0 Sandeep Singh 2020-01-09  198  					   cl_data->report_descr=
[i]);
da2b6403065dd0 Sandeep Singh 2020-01-09  199  		rc =3D amdtp_hid_probe(cl_d=
ata->cur_hid_dev, cl_data);
da2b6403065dd0 Sandeep Singh 2020-01-09  200  		rc =3D amd_start_sensor(cl_=
dev->pdev, info);
da2b6403065dd0 Sandeep Singh 2020-01-09  201  			cl_data->sensor_sts[i] =3D=
 1;
da2b6403065dd0 Sandeep Singh 2020-01-09  202  	}
da2b6403065dd0 Sandeep Singh 2020-01-09  203  =

da2b6403065dd0 Sandeep Singh 2020-01-09  204  	cl_dev->cl_data =3D cl_data;
da2b6403065dd0 Sandeep Singh 2020-01-09  205  	cl_data_context =3D cl_data;
da2b6403065dd0 Sandeep Singh 2020-01-09  206  	platform_set_drvdata(pdev, c=
l_dev);
da2b6403065dd0 Sandeep Singh 2020-01-09  207  	schedule_delayed_work(&cl_da=
ta->work_buffer, PERIOD);
da2b6403065dd0 Sandeep Singh 2020-01-09  208  	return 0;
da2b6403065dd0 Sandeep Singh 2020-01-09  209  }
da2b6403065dd0 Sandeep Singh 2020-01-09  210  =

da2b6403065dd0 Sandeep Singh 2020-01-09  211  static int amd_sfh_hid_client=
_remove(struct platform_device *pdev)
da2b6403065dd0 Sandeep Singh 2020-01-09  212  {
da2b6403065dd0 Sandeep Singh 2020-01-09  213  	int i;
da2b6403065dd0 Sandeep Singh 2020-01-09  214  	struct amdtp_cl_device *cl_d=
ev;
da2b6403065dd0 Sandeep Singh 2020-01-09  215  	struct amdtp_cl_data *cl_dat=
a;
da2b6403065dd0 Sandeep Singh 2020-01-09  216  =

da2b6403065dd0 Sandeep Singh 2020-01-09  217  	cl_dev =3D platform_get_drvd=
ata(pdev);
da2b6403065dd0 Sandeep Singh 2020-01-09 @218  	cl_data =3D cl_dev->cl_data;
da2b6403065dd0 Sandeep Singh 2020-01-09  219  =

da2b6403065dd0 Sandeep Singh 2020-01-09 @220  	for (i =3D 0; i < cl_data->n=
um_hid_devices; i++)
da2b6403065dd0 Sandeep Singh 2020-01-09  221  		amd_stop_sensor(cl_dev->pde=
v, i);
da2b6403065dd0 Sandeep Singh 2020-01-09  222  	cancel_delayed_work_sync(&cl=
_data->work);
da2b6403065dd0 Sandeep Singh 2020-01-09  223  	cancel_delayed_work_sync(&cl=
_data->work_buffer);
da2b6403065dd0 Sandeep Singh 2020-01-09  224  	amdsfh_debugfs_destroy(cl_da=
ta);
da2b6403065dd0 Sandeep Singh 2020-01-09 @225  	if (cl_dev && cl_data)
                                                    ^^^^^^    ^^^^^^^
If these are NULL, it's too late.

da2b6403065dd0 Sandeep Singh 2020-01-09  226  		amdtp_hid_remove(cl_data);
da2b6403065dd0 Sandeep Singh 2020-01-09  227  =

da2b6403065dd0 Sandeep Singh 2020-01-09  228  	for (i =3D 0; i < cl_data->n=
um_hid_devices; i++) {
da2b6403065dd0 Sandeep Singh 2020-01-09  229  		if (cl_data->sensor_virt_ad=
dr[i])
da2b6403065dd0 Sandeep Singh 2020-01-09  230  			dma_free_coherent(&pdev->d=
ev, 8 * sizeof(int),
da2b6403065dd0 Sandeep Singh 2020-01-09  231  					  cl_data->sensor_virt_a=
ddr[i],
da2b6403065dd0 Sandeep Singh 2020-01-09  232  					  cl_data->sensor_phy_ad=
dr[i]);
da2b6403065dd0 Sandeep Singh 2020-01-09  233  	}
da2b6403065dd0 Sandeep Singh 2020-01-09  234  =

da2b6403065dd0 Sandeep Singh 2020-01-09  235  	kfree(cl_data);
da2b6403065dd0 Sandeep Singh 2020-01-09  236  	pr_info("%s:%s Exit\n", DRIV=
ER_NAME, __func__);
da2b6403065dd0 Sandeep Singh 2020-01-09  237  	return 0;
da2b6403065dd0 Sandeep Singh 2020-01-09  238  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1939386228496296095==--

