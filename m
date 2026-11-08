Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142901;
	b=Zie0II4zDJBiUg7JoZ0ncSHyIPLKo1m0sXudnjomj9kULKv8AI4XnQmaTK1/BcbwCG8J
	 IHDop3B3CFb6wrh3PMchFcPsbgMAnXnhkTUn4X+22oJcnmaqy0MyMAbbxnTP04N+x/Zbz
	 biNLAuDPG0h71XWhhq792+TyCpFJclP8lSVLQ26XVWgq6kfVOnC63WT+3gwGuBrnqZXg+
	 p3kljJKovsWvkT7vd0a7PSbem0sorS+CxCEYYmhcIAIlYFzbYMNlxKoj83k2H5y8hZmHd
	 J566547YgXaSomE3AkUcSJ/kf3aXin6omQoxtgqENuOOGSh3bsR+qpKbxHYLreLS4qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142901;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IKduHhndd86zphma0x4oYjyZ7Du9Zb+R1IWRW1XGw30=;
	b=LtPzW540/8uWOGT4YpeC6KBtYvo9XL8by8BP0Bz196Wta2eWqkk3QXXDj6WZnK+uoOpG
	 ADkRYSOKVJ+OH5DrpPW3cKc/0wiw5t/YD+fG/0lMXBbd1ksWJqKkRUwnL/V56XIvgoAT5
	 hph/+iIjT0A4xTTvTYCXIE1WilgdXRKcR4tLHUyF7ymbHPBoheW8tq7aktTIsupSEDldf
	 xufFm6lclgcaQ7HhDEwyDpe4LSXnChgTp/XWBVbVJ7LgaGQwKFqCKsr3F0tS6wCVb2mH9
	 mPfkTHHnn0q30obrN4MaX7x3W2XlbtfR6/PFaoR3adQI8o8WMk/lCUvwpVHO9AS1bQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Zx/EsKv0";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BDB606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 13:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zx/EsKv0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794142900; x=1825678900;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fDu9t1D3JzLb5tCa1igDkkkqPD1ZJrbo/gbze/DN4Kg=;
  b=Zx/EsKv0q5vSJMyUmiphx4iU+GVpTwEzZeymRIWum516Sz0LGjZyOtVn
   wSxdiOQMs23ylX4E85c0fbbMPO265KBXe8imRQ6JmHjNmPBsULltfLIEr
   csUjXGvwKlzE4vnCnce6vNwy/An0/lGLHiQ3vjgR3ZXtzUG3WH6U6mUaO
   Ymc/TloVuJLhjnF12G9WbDnqo2oLqwZYloTKqY0/DXIfnY0zPKCYskg1w
   rW6SYGJBBtJO2N7QcCgKX8a4Y66N/Xu4Ovx8KgRnc26wG24t4T4kvoz61
   FfCYj3uo3F4G3VvAUjnEGgWO9JnBmVAUqdlEh8D5Jr2M4M8IjTZ3jJQyJ
   g==;
X-CSE-ConnectionGUID: x4brD03wQoSS/4NYXKYeNw==
X-CSE-MsgGUID: A8JzwKjbRHSP3r7Hz0fUtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2768413"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2768413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 05:01:40 -0800
X-CSE-ConnectionGUID: yVVTwsRxTD+sjnjL4v1PWA==
X-CSE-MsgGUID: +byjExdXRs6pw5waG7qHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="8011324"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Nov 2026 05:01:38 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ2Wd-00000000BV9-2lh8;
	Sun, 08 Nov 2026 13:01:35 +0000
Date: Sun, 08 Nov 2026 14:01:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [wsa:i2c/for-andi 13/16]
 drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn:
 pm_runtime_get_sync() also returns 1 on success
Message-ID: <202611081308.P8lYvNIg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-andi
head:   f3adfdab5e653345b7a520776ef9c7885e87de92
commit: e3e199d44d27ceb2f4a104fff8330025823e9e85 [13/16] i2c: nomadik: hand=
le pm_runtime errors
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: alpha-randconfig-2200-20261108 (https://download.01.org/0day-ci/arc=
hive/20261108/202611081308.P8lYvNIg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611081308.P8lYvNIg-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sy=
nc() also returns 1 on success

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL error #2: near "=
and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:64 SQL: 'select * from =
return_states where  and type =3D 1044 and parameter =3D -1 and key =3D '$'=
 limit 1;'

vim +737 drivers/i2c/busses/i2c-nomadik.c

82a4413450376c Linus Walleij            2011-05-13  682 =20
3f9900f17cdb03 srinidhi kasagar         2010-02-01  683  /**
3f9900f17cdb03 srinidhi kasagar         2010-02-01  684   * nmk_i2c_xfer() =
- I2C transfer function used by kernel framework
1804edd15c66a7 Linus Walleij            2010-09-23  685   * @i2c_adap: Adap=
ter pointer to the controller
1804edd15c66a7 Linus Walleij            2010-09-23  686   * @msgs: Pointer =
to data to be written.
1804edd15c66a7 Linus Walleij            2010-09-23  687   * @num_msgs: Numb=
er of messages to be executed
3f9900f17cdb03 srinidhi kasagar         2010-02-01  688   *
3f9900f17cdb03 srinidhi kasagar         2010-02-01  689   * This is the fun=
ction called by the generic kernel i2c_transfer()
3f9900f17cdb03 srinidhi kasagar         2010-02-01  690   * or i2c_smbus...=
() API calls. Note that this code is protected by the
3f9900f17cdb03 srinidhi kasagar         2010-02-01  691   * semaphore set i=
n the kernel i2c_transfer() function.
3f9900f17cdb03 srinidhi kasagar         2010-02-01  692   *
3f9900f17cdb03 srinidhi kasagar         2010-02-01  693   * NOTE:
3f9900f17cdb03 srinidhi kasagar         2010-02-01  694   * READ TRANSFER :=
 We impose a restriction of the first message to be the
3f9900f17cdb03 srinidhi kasagar         2010-02-01  695   *		index message =
for any read transaction.
3f9900f17cdb03 srinidhi kasagar         2010-02-01  696   *		- a no index i=
s coded as '0',
3f9900f17cdb03 srinidhi kasagar         2010-02-01  697   *		- 2byte big en=
dian index is coded as '3'
3f9900f17cdb03 srinidhi kasagar         2010-02-01  698   *		!!! msg[0].buf=
 holds the actual index.
3f9900f17cdb03 srinidhi kasagar         2010-02-01  699   *		This is compat=
ible with generic messages of smbus emulator
3f9900f17cdb03 srinidhi kasagar         2010-02-01  700   *		that send a on=
e byte index.
3f9900f17cdb03 srinidhi kasagar         2010-02-01  701   *		eg. a I2C tran=
sation to read 2 bytes from index 0
3f9900f17cdb03 srinidhi kasagar         2010-02-01  702   *			idx =3D 0;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  703   *			msg[0].addr =
=3D client->addr;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  704   *			msg[0].flags =
=3D 0x0;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  705   *			msg[0].len =
=3D 1;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  706   *			msg[0].buf =
=3D &idx;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  707   *
3f9900f17cdb03 srinidhi kasagar         2010-02-01  708   *			msg[1].addr =
=3D client->addr;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  709   *			msg[1].flags =
=3D I2C_M_RD;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  710   *			msg[1].len =
=3D 2;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  711   *			msg[1].buf =
=3D rd_buff
3f9900f17cdb03 srinidhi kasagar         2010-02-01  712   *			i2c_transfer(=
adap, msg, 2);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  713   *
3f9900f17cdb03 srinidhi kasagar         2010-02-01  714   * WRITE TRANSFER =
: The I2C standard interface interprets all data as payload.
3f9900f17cdb03 srinidhi kasagar         2010-02-01  715   *		If you want to=
 emulate an SMBUS write transaction put the
3f9900f17cdb03 srinidhi kasagar         2010-02-01  716   *		index as first=
 byte(or first and second) in the payload.
3f9900f17cdb03 srinidhi kasagar         2010-02-01  717   *		eg. a I2C tran=
sation to write 2 bytes from index 1
3f9900f17cdb03 srinidhi kasagar         2010-02-01  718   *			wr_buff[0] =
=3D 0x1;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  719   *			wr_buff[1] =
=3D 0x23;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  720   *			wr_buff[2] =
=3D 0x46;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  721   *			msg[0].flags =
=3D 0x0;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  722   *			msg[0].len =
=3D 3;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  723   *			msg[0].buf =
=3D wr_buff;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  724   *			i2c_transfer(=
adap, msg, 1);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  725   *
3f9900f17cdb03 srinidhi kasagar         2010-02-01  726   * To read or writ=
e a block of data (multiple bytes) using SMBUS emulation
3f9900f17cdb03 srinidhi kasagar         2010-02-01  727   * please use the =
i2c_smbus_read_i2c_block_data()
3f9900f17cdb03 srinidhi kasagar         2010-02-01  728   * or i2c_smbus_wr=
ite_i2c_block_data() API
3f9900f17cdb03 srinidhi kasagar         2010-02-01  729   */
3f9900f17cdb03 srinidhi kasagar         2010-02-01  730  static int nmk_i2c=
_xfer(struct i2c_adapter *i2c_adap,
3f9900f17cdb03 srinidhi kasagar         2010-02-01  731  		struct i2c_msg m=
sgs[], int num_msgs)
3f9900f17cdb03 srinidhi kasagar         2010-02-01  732  {
e3e199d44d27ce Dmitry Guzman            2026-11-03  733  	int status, i;
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  734  	struct nmk_i=
2c_dev *priv =3D i2c_get_adapdata(i2c_adap);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  735 =20
e3e199d44d27ce Dmitry Guzman            2026-11-03  736  	status =3D pm_run=
time_get_sync(&priv->adev->dev);
e3e199d44d27ce Dmitry Guzman            2026-11-03 @737  	if (status)
e3e199d44d27ce Dmitry Guzman            2026-11-03  738  		return status;
a20d23945f30ec Jonas Aberg              2011-05-13  739 =20
3f9900f17cdb03 srinidhi kasagar         2010-02-01  740  	/* setup the i2c =
controller */
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  741  	setup_i2c_co=
ntroller(priv);
3f9900f17cdb03 srinidhi kasagar         2010-02-01  742 =20
3f9900f17cdb03 srinidhi kasagar         2010-02-01  743  	for (i =3D 0; i <=
 num_msgs; i++) {
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  744  		priv->cli.s=
lave_adr	=3D msgs[i].addr;
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  745  		priv->cli.b=
uffer		=3D msgs[i].buf;
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  746  		priv->cli.c=
ount		=3D msgs[i].len;
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  747  		priv->stop =
=3D (i < (num_msgs - 1)) ? 0 : 1;
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  748  		priv->resul=
t =3D 0;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  749 =20
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  750  		status =3D =
nmk_i2c_xfer_one(priv, msgs[i].flags);
82a4413450376c Linus Walleij            2011-05-13  751  		if (status !=3D =
0)
ebd10e0783d9fb Virupax Sadashivpetimath 2011-05-13  752  			break;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  753  	}
a20d23945f30ec Jonas Aberg              2011-05-13  754 =20
ae9977eefc4a1e Th=C3=A9o Lebrun              2024-03-06  755  	pm_runtime_p=
ut_sync(&priv->adev->dev);
a20d23945f30ec Jonas Aberg              2011-05-13  756 =20
3f9900f17cdb03 srinidhi kasagar         2010-02-01  757  	/* return the no.=
 messages processed */
3f9900f17cdb03 srinidhi kasagar         2010-02-01  758  	if (status)
3f9900f17cdb03 srinidhi kasagar         2010-02-01  759  		return status;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  760  	else
3f9900f17cdb03 srinidhi kasagar         2010-02-01  761  		return num_msgs;
3f9900f17cdb03 srinidhi kasagar         2010-02-01  762  }
3f9900f17cdb03 srinidhi kasagar         2010-02-01  763 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
