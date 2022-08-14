Content-Type: multipart/mixed; boundary="===============9200619428652011170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Input: HID-rmi - ignore to rmi_hid_read_block after system resumes.
Date: Sun, 14 Aug 2022 22:55:56 +0800
Message-ID: <202208142212.QB3fvm5l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9200619428652011170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <1659336403-2546-1-git-send-email-marge.yang@synaptics.corp-=
partner.google.com>
References: <1659336403-2546-1-git-send-email-marge.yang@synaptics.corp-p=
artner.google.com>
TO: margeyang <marge.yang@synaptics.corp-partner.google.com>
TO: dmitry.torokhov(a)gmail.com
TO: linux-input(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: marge.yang(a)tw.synaptics.com
CC: derek.chegn(a)tw.synaptcs.com
CC: vincent.huang(a)tw.synaptics.com
CC: Marge Yang <marge.yang@synaptics.corp-partner.google.com>

Hi margeyang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next linus/master v5.19 next-2022081=
2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/margeyang/Input-HID-=
rmi-ignore-to-rmi_hid_read_block-after-system-resumes/20220801-145006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-m001-20220801 (https://download.01.org/0day-ci/ar=
chive/20220814/202208142212.QB3fvm5l-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/hid/hid-rmi.c:263 rmi_hid_read_block() error: uninitialized symbol =
'ret'.

Old smatch warnings:
drivers/hid/hid-rmi.c:356 rmi_read_data_event() warn: check sign expansion =
for 'size'

vim +/ret +263 drivers/hid/hid-rmi.c

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  187  =

0b2c7a897378f1 Andrew Duggan      2017-01-05  188  static int rmi_hid_read_=
block(struct rmi_transport_dev *xport, u16 addr,
0b2c7a897378f1 Andrew Duggan      2017-01-05  189  		void *buf, size_t len)
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  190  {
0b2c7a897378f1 Andrew Duggan      2017-01-05  191  	struct rmi_data *data =
=3D container_of(xport, struct rmi_data, xport);
0b2c7a897378f1 Andrew Duggan      2017-01-05  192  	struct hid_device *hdev=
 =3D data->hdev;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  193  	int ret;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  194  	int bytes_read;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  195  	int bytes_needed;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  196  	int retries;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  197  	int read_input_count;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  198  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  199  	mutex_lock(&data->page_=
mutex);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  200  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  201  	if (RMI_PAGE(addr) !=3D=
 data->page) {
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  202  		ret =3D rmi_set_page(h=
dev, RMI_PAGE(addr));
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  203  		if (ret < 0)
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  204  			goto exit;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  205  	}
30a3df7ece6145 Marge Yang         2022-08-01  206  	if (ignoreonce =3D=3D 1=
) {
30a3df7ece6145 Marge Yang         2022-08-01  207  		dev_err(&hdev->dev,
30a3df7ece6145 Marge Yang         2022-08-01  208  			"ignoreonce (%d)\n",
30a3df7ece6145 Marge Yang         2022-08-01  209  			ignoreonce);
30a3df7ece6145 Marge Yang         2022-08-01  210  		ignoreonce =3D 0;
30a3df7ece6145 Marge Yang         2022-08-01  211  		goto exit;
30a3df7ece6145 Marge Yang         2022-08-01  212  	}
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  213  	for (retries =3D 5; ret=
ries > 0; retries--) {
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  214  		data->writeReport[0] =
=3D RMI_READ_ADDR_REPORT_ID;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  215  		data->writeReport[1] =
=3D 0; /* old 1 byte read count */
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  216  		data->writeReport[2] =
=3D addr & 0xFF;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  217  		data->writeReport[3] =
=3D (addr >> 8) & 0xFF;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  218  		data->writeReport[4] =
=3D len  & 0xFF;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  219  		data->writeReport[5] =
=3D (len >> 8) & 0xFF;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  220  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  221  		set_bit(RMI_READ_REQUE=
ST_PENDING, &data->flags);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  222  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  223  		ret =3D rmi_write_repo=
rt(hdev, data->writeReport,
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  224  						data->output_repor=
t_size);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  225  		if (ret !=3D data->out=
put_report_size) {
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  226  			dev_err(&hdev->dev,
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  227  				"failed to write req=
uest output report (%d)\n",
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  228  				ret);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  229  			goto exit;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  230  		}
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  231  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  232  		bytes_read =3D 0;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  233  		bytes_needed =3D len;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  234  		while (bytes_read < le=
n) {
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  235  			if (!wait_event_timeo=
ut(data->wait,
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  236  				test_bit(RMI_READ_DA=
TA_PENDING, &data->flags),
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  237  					msecs_to_jiffies(10=
00))) {
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  238  				hid_warn(hdev, "%s: =
timeout elapsed\n",
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  239  					 __func__);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  240  				ret =3D -EAGAIN;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  241  				break;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  242  			}
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  243  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  244  			read_input_count =3D =
data->readReport[1];
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  245  			memcpy(buf + bytes_re=
ad, &data->readReport[2],
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  246  				read_input_count < b=
ytes_needed ?
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  247  					read_input_count : =
bytes_needed);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  248  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  249  			bytes_read +=3D read_=
input_count;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  250  			bytes_needed -=3D rea=
d_input_count;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  251  			clear_bit(RMI_READ_DA=
TA_PENDING, &data->flags);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  252  		}
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  253  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  254  		if (ret >=3D 0) {
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  255  			ret =3D 0;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  256  			break;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  257  		}
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  258  	}
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  259  =

9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  260  exit:
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  261  	clear_bit(RMI_READ_REQU=
EST_PENDING, &data->flags);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  262  	mutex_unlock(&data->pag=
e_mutex);
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07 @263  	return ret;
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  264  }
9fb6bf02e3ad04 Benjamin Tissoires 2014-04-07  265  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9200619428652011170==--

