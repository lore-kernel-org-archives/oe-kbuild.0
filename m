Content-Type: multipart/mixed; boundary="===============8514564150932884284=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/i2c-hid/i2c-hid-core.c:231:29: warning: Possible null pointer dereference: args [nullPointer]
Date: Mon, 10 May 2021 20:40:32 +0800
Message-ID: <202105102025.OJiVlE1H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8514564150932884284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Douglas Anderson <dianders@chromium.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6efb943b8616ec53a5e444193dccf1af9ad627b5
commit: b33752c300232d7f95dd9a4353947d0c9e6a0e52 HID: i2c-hid: Reorganize s=
o ACPI and OF are separate modules
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
compiler: sparc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hid/i2c-hid/i2c-hid-core.c:231:29: warning: Possible null pointe=
r dereference: args [nullPointer]
    memcpy(cmd->data + length, args, args_len);
                               ^
   drivers/hid/i2c-hid/i2c-hid-core.c:281:50: note: Calling function '__i2c=
_hid_command', 5th argument 'NULL' value is 0
    return __i2c_hid_command(client, command, 0, 0, NULL, 0,
                                                    ^
   drivers/hid/i2c-hid/i2c-hid-core.c:231:29: note: Null pointer dereference
    memcpy(cmd->data + length, args, args_len);
                               ^

vim +231 drivers/hid/i2c-hid/i2c-hid-core.c

71af01a8c85ad8 drivers/hid/i2c-hid/i2c-hid.c HungNien Chen      2016-11-10 =
 202  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 203  static int __i2c_hid_command(struct i2c_client *client,
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 204  		const struct i2c_hid_cmd *command, u8 reportID,
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 205  		u8 reportType, u8 *args, int args_len,
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 206  		unsigned char *buf_recv, int data_len)
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 207  {
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 208  	struct i2c_hid *ihid =3D i2c_get_clientdata(client);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 209  	union command *cmd =3D (union command *)ihid->cmdbuf;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 210  	int ret;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 211  	struct i2c_msg msg[2];
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 212  	int msg_num =3D 1;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 213  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 214  	int length =3D command->length;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 215  	bool wait =3D command->wait;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 216  	unsigned int registerIndex =3D command->registerIndex;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 217  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 218  	/* special case for hid_descr_cmd */
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 219  	if (command =3D=3D &hid_descr_cmd) {
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 220  		cmd->c.reg =3D ihid->wHIDDescRegister;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 221  	} else {
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 222  		cmd->data[0] =3D ihid->hdesc_buffer[registerIndex];
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 223  		cmd->data[1] =3D ihid->hdesc_buffer[registerIndex + 1];
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 224  	}
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 225  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 226  	if (length > 2) {
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 227  		cmd->c.opcode =3D command->opcode;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 228  		cmd->c.reportTypeID =3D reportID | reportType << 4;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 229  	}
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 230  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
@231  	memcpy(cmd->data + length, args, args_len);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 232  	length +=3D args_len;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 233  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 234  	i2c_hid_dbg(ihid, "%s: cmd=3D%*ph\n", __func__, length, cmd->data);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 235  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 236  	msg[0].addr =3D client->addr;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 237  	msg[0].flags =3D client->flags & I2C_M_TEN;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 238  	msg[0].len =3D length;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 239  	msg[0].buf =3D cmd->data;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 240  	if (data_len > 0) {
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 241  		msg[1].addr =3D client->addr;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 242  		msg[1].flags =3D client->flags & I2C_M_TEN;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 243  		msg[1].flags |=3D I2C_M_RD;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 244  		msg[1].len =3D data_len;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 245  		msg[1].buf =3D buf_recv;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 246  		msg_num =3D 2;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 247  		set_bit(I2C_HID_READ_PENDING, &ihid->flags);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 248  	}
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 249  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 250  	if (wait)
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 251  		set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 252  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 253  	ret =3D i2c_transfer(client->adapter, msg, msg_num);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 254  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 255  	if (data_len > 0)
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 256  		clear_bit(I2C_HID_READ_PENDING, &ihid->flags);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 257  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 258  	if (ret !=3D msg_num)
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 259  		return ret < 0 ? ret : -EIO;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 260  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 261  	ret =3D 0;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 262  =

402946a8ef71eb drivers/hid/i2c-hid/i2c-hid.c Hans de Goede      2017-11-07 =
 263  	if (wait && (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET)) {
402946a8ef71eb drivers/hid/i2c-hid/i2c-hid.c Hans de Goede      2017-11-07 =
 264  		msleep(100);
402946a8ef71eb drivers/hid/i2c-hid/i2c-hid.c Hans de Goede      2017-11-07 =
 265  	} else if (wait) {
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 266  		i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 267  		if (!wait_event_timeout(ihid->wait,
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 268  				!test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 269  				msecs_to_jiffies(5000)))
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 270  			ret =3D -ENODATA;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 271  		i2c_hid_dbg(ihid, "%s: finished.\n", __func__);
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 272  	}
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 273  =

4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 274  	return ret;
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 275  }
4a200c3b9a4024 drivers/hid/i2c-hid/i2c-hid.c Benjamin Tissoires 2012-11-12 =
 276  =


:::::: The code at line 231 was first introduced by commit
:::::: 4a200c3b9a40242652b5734630bdd0bcf3aca75f HID: i2c-hid: introduce HID=
 over i2c specification implementation

:::::: TO: Benjamin Tissoires <benjamin.tissoires@gmail.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8514564150932884284==--

