Content-Type: multipart/mixed; boundary="===============0002153773673961985=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 576/923] drivers/dma/xilinx/xilinx_frmbuf.c:619:8-16: ERROR: invalid reference to the index variable of the iterator on line 605
Date: Thu, 10 Feb 2022 22:28:05 +0800
Message-ID: <202202102252.kvij0VyU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0002153773673961985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Jeffrey Mouroux <jeff.mouroux@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Pandey <radheys@xilinx.com>
CC: John Nichols <jnichol@xilinx.com>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   966124532656bc95d781abf57531e4cd4f962237
commit: c869e53ce34decde8d196cb8032d248031278784 [576/923] dmaengine: xilin=
x_frmbuf: New driver for Video Framebuffer IP
:::::: branch date: 6 hours ago
:::::: commit date: 9 days ago
config: h8300-randconfig-c004-20220210 (https://download.01.org/0day-ci/arc=
hive/20220210/202202102252.kvij0VyU-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/dma/xilinx/xilinx_frmbuf.c:619:8-16: ERROR: invalid reference to=
 the index variable of the iterator on line 605

vim +619 drivers/dma/xilinx/xilinx_frmbuf.c

c869e53ce34dec Jeffrey Mouroux 2017-07-13  598  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  599  static struct xilinx_frmbuf=
_chan *frmbuf_find_chan(struct dma_chan *chan)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  600  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  601  	struct xilinx_frmbuf_chan =
*xil_chan;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  602  	bool found_xchan =3D false;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  603  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  604  	mutex_lock(&frmbuf_chan_li=
st_lock);
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @605  	list_for_each_entry(xil_ch=
an, &frmbuf_chan_list, chan_node) {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  606  		if (chan =3D=3D &xil_chan=
->common) {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  607  			found_xchan =3D true;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  608  			break;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  609  		}
c869e53ce34dec Jeffrey Mouroux 2017-07-13  610  	}
c869e53ce34dec Jeffrey Mouroux 2017-07-13  611  	mutex_unlock(&frmbuf_chan_=
list_lock);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  612  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  613  	if (!found_xchan) {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  614  		dev_dbg(chan->device->dev,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  615  			"dma chan not a Video Fr=
amebuffer channel instance\n");
c869e53ce34dec Jeffrey Mouroux 2017-07-13  616  		return ERR_PTR(-EINVAL);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  617  	}
c869e53ce34dec Jeffrey Mouroux 2017-07-13  618  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13 @619  	return xil_chan;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  620  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  621  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0002153773673961985==--

