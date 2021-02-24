Content-Type: multipart/mixed; boundary="===============7845985777777761379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/wimax/i2400m/op-rfkill.c:105:9: warning: Variable 'result' is reassigned a value before the old one has been used. 'break; '
Date: Wed, 24 Feb 2021 17:20:52 +0800
Message-ID: <202102241736.wzyRi3O6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7845985777777761379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c03c21ba6f4e95e406a1a7b4c34ef334b977c194
commit: f54ec58fee837ec847cb8b50593e81bfaa46107f wimax: move out to staging
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/staging/wimax/i2400m/op-rfkill.c:105:9: warning: Variable 'resul=
t' is reassigned a value before the old one has been used. 'break;' missing=
? [redundantAssignInSwitch]
    result =3D PTR_ERR(ack_skb);
           ^
   drivers/staging/wimax/i2400m/op-rfkill.c:84:9: note: Variable 'result' i=
s reassigned a value before the old one has been used. 'break;' missing?
    result =3D -ENOMEM;
           ^
   drivers/staging/wimax/i2400m/op-rfkill.c:105:9: note: Variable 'result' =
is reassigned a value before the old one has been used. 'break;' missing?
    result =3D PTR_ERR(ack_skb);
           ^
   drivers/staging/wimax/linux-wimax-debug.h:477:12: warning: sscanf() with=
out field width limits can crash with huge input data. [invalidscanf]
     tokens =3D sscanf(token, "%sn%u", submodule, &level);
              ^

vim +105 drivers/staging/wimax/i2400m/op-rfkill.c

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   48  =

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   49  =

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   50  /*
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   51   * WiMAX stack operation: implement SW RFKill toggling
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   52   *
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   53   * @wimax_dev: device descriptor
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   54   * @skb: skb where the message has been received; skb->data =
is
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   55   *       expected to point to the message payload.
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   56   * @genl_info: passed by the generic netlink layer
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   57   *
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   58   * Generic Netlink will call this function when a message is=
 sent from
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   59   * userspace to change the software RF-Kill switch status.
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   60   *
25985edcedea63 drivers/net/wimax/i2400m/op-rfkill.c Lucas De Marchi      20=
11-03-30   61   * This function will set the device's software RF-Kill swit=
ch state to
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   62   * match what is requested.
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   63   *
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   64   * NOTE: the i2400m has a strict state machine; we can only =
set the
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   65   *       RF-Kill switch when it is on, the HW RF-Kill is on =
and the
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   66   *       device is initialized. So we ignore errors steaming=
 from not
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   67   *       being in the right state (-EILSEQ).
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   68   */
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   69  int i2400m_op_rfkill_sw_toggle(struct wimax_dev *wimax_dev,
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   70  			       enum wimax_rf_state state)
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   71  {
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   72  	int result;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   73  	struct i2400m *i2400m =3D wimax_dev_to_i2400m(wimax_dev);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   74  	struct device *dev =3D i2400m_dev(i2400m);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   75  	struct sk_buff *ack_skb;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   76  	struct {
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   77  		struct i2400m_l3l4_hdr hdr;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   78  		struct i2400m_tlv_rf_operation sw_rf;
ba2d3587912f82 drivers/net/wimax/i2400m/op-rfkill.c Eric Dumazet         20=
10-06-02   79  	} __packed *cmd;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   80  	char strerr[32];
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   81  =

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   82  	d_fnstart(4, dev, "(wimax_dev %p state %d)\n", wimax_dev, s=
tate);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   83  =

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   84  	result =3D -ENOMEM;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   85  	cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   86  	if (cmd =3D=3D NULL)
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   87  		goto error_alloc;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   88  	cmd->hdr.type =3D cpu_to_le16(I2400M_MT_CMD_RF_CONTROL);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   89  	cmd->hdr.length =3D sizeof(cmd->sw_rf);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   90  	cmd->hdr.version =3D cpu_to_le16(I2400M_L3L4_VERSION);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   91  	cmd->sw_rf.hdr.type =3D cpu_to_le16(I2400M_TLV_RF_OPERATION=
);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   92  	cmd->sw_rf.hdr.length =3D cpu_to_le16(sizeof(cmd->sw_rf.sta=
tus));
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   93  	switch (state) {
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   94  	case WIMAX_RF_OFF:	/* RFKILL ON, radio OFF */
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   95  		cmd->sw_rf.status =3D cpu_to_le32(2);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   96  		break;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   97  	case WIMAX_RF_ON:	/* RFKILL OFF, radio ON */
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   98  		cmd->sw_rf.status =3D cpu_to_le32(1);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20   99  		break;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  100  	default:
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  101  		BUG();
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  102  	}
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  103  =

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  104  	ack_skb =3D i2400m_msg_to_dev(i2400m, cmd, sizeof(*cmd));
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20 @105  	result =3D PTR_ERR(ack_skb);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  106  	if (IS_ERR(ack_skb)) {
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  107  		dev_err(dev, "Failed to issue 'RF Control' command: %d\n",
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  108  			result);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  109  		goto error_msg_to_dev;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  110  	}
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  111  	result =3D i2400m_msg_check_status(wimax_msg_data(ack_skb),
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  112  					 strerr, sizeof(strerr));
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  113  	if (result < 0) {
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  114  		dev_err(dev, "'RF Control' (0x%04x) command failed: %d - %=
s\n",
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  115  			I2400M_MT_CMD_RF_CONTROL, result, strerr);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  116  		goto error_cmd;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  117  	}
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  118  =

024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  119  	/* Now we wait for the state to change to RADIO_OFF or RADI=
O_ON */
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  120  	result =3D wait_event_timeout(
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  121  		i2400m->state_wq, i2400m_radio_is(i2400m, state),
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  122  		5 * HZ);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  123  	if (result =3D=3D 0)
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  124  		result =3D -ETIMEDOUT;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  125  	if (result < 0)
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  126  		dev_err(dev, "Error waiting for device to toggle RF state:=
 "
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  127  			"%d\n", result);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  128  	result =3D 0;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  129  error_cmd:
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  130  	kfree_skb(ack_skb);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  131  error_msg_to_dev:
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  132  error_alloc:
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  133  	d_fnend(4, dev, "(wimax_dev %p state %d) =3D %d\n",
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  134  		wimax_dev, state, result);
6f3ef5c25cc762 drivers/net/wimax/i2400m/op-rfkill.c Navid Emamdoost      20=
19-10-25  135  	kfree(cmd);
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  136  	return result;
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  137  }
024f7f31ed15c4 drivers/net/wimax/i2400m/op-rfkill.c Inaky Perez-Gonzalez 20=
08-12-20  138  =


:::::: The code@line 105 was first introduced by commit
:::::: 024f7f31ed15c471f80408d8b5045497e27e1135 i2400m: Generic probe/disco=
nnect, reset and message passing

:::::: TO: Inaky Perez-Gonzalez <inaky@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7845985777777761379==--

