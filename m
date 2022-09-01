Content-Type: multipart/mixed; boundary="===============7809780090375541751=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-ci:v3_20220816_patrice_chotard_spi_stm32_qspi_use_qspi_bus_as_8_lines_communication_channel 13/13] drivers/spi/spi-stm32-qspi.c:633:21: warning: use of uninitialized value 'ret' [CWE-457]
Date: Fri, 02 Sep 2022 05:52:38 +0800
Message-ID: <202209020551.lN8fuIWX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7809780090375541751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/s=
pi/spi-stm32-qspi.c:633:21: warning: use of uninitialized value 'ret' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Patrice Chotard <patrice.chotard@foss.st.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_2=
0220816_patrice_chotard_spi_stm32_qspi_use_qspi_bus_as_8_lines_communicatio=
n_channel
head:   b051161f44d414e736fa2b011245441bae9babd7
commit: b051161f44d414e736fa2b011245441bae9babd7 [13/13] spi: stm32_qspi: A=
dd transfer_one_message() spi callback
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220902/202209020551.lN8fuIWX-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/co=
mmit/?id=3Db051161f44d414e736fa2b011245441bae9babd7
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kern=
el/git/broonie/ci.git
        git fetch --no-tags broonie-ci v3_20220816_patrice_chotard_spi_stm3=
2_qspi_use_qspi_bus_as_8_lines_communication_channel
        git checkout b051161f44d414e736fa2b011245441bae9babd7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In function 'stm32_qspi_transfer_one_message':
   cc1: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyz=
er-use-of-uninitialized-value]
     'stm32_qspi_transfer_one_message': events 1-6
       |
       |drivers/spi/spi-stm32-qspi.c:573:12:
       |  573 |         if (!spi->cs_gpiod)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  576 |         mutex_lock(&qspi->lock);
       |      |         ~~~~~~~~~~
       |      |         |
       |      |         (2) ...to here
       |......
       |  595 |                 if (transfer->dummy_data) {
       |      |                    ~
       |      |                    |
       |      |                    (3) following 'true' branch...
       |  596 |                         op.dummy.buswidth =3D transfer->tx_=
nbits;
       |      |                         ~~
       |      |                         |
       |      |                         (4) ...to here
       |......
       |  601 |                         if (list_is_last(&transfer->transfe=
r_list, &msg->transfers))
       |      |                            ~
       |      |                            |
       |      |                            (5) following 'true' branch...
       |  602 |                                 goto end_of_transfer;
       |      |                                 ~~~~
       |      |                                 |
       |      |                                 (6) ...to here
       |
     'stm32_qspi_transfer_one_message': event 7
       |
       |cc1:
       | (7): use of uninitialized value '=1B[01m=1B[K<unknown>=1B[m=1B[K' =
here
       |
>> drivers/spi/spi-stm32-qspi.c:633:21: warning: use of uninitialized value=
 'ret' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     633 |         msg->status =3D ret;
         |         ~~~~~~~~~~~~^~~~~
     'stm32_qspi_transfer_one_message': events 1-8
       |
       |  571 |         int ret;
       |      |             ^~~
       |      |             |
       |      |             (1) region created on stack here
       |  572 | =

       |  573 |         if (!spi->cs_gpiod)
       |      |            ~ =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  576 |         mutex_lock(&qspi->lock);
       |      |         ~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       |  595 |                 if (transfer->dummy_data) {
       |      |                    ~
       |      |                    |
       |      |                    (4) following 'true' branch...
       |  596 |                         op.dummy.buswidth =3D transfer->tx_=
nbits;
       |      |                         ~~
       |      |                         |
       |      |                         (5) ...to here
       |......
       |  601 |                         if (list_is_last(&transfer->transfe=
r_list, &msg->transfers))
       |      |                            ~
       |      |                            |
       |      |                            (6) following 'true' branch...
       |  602 |                                 goto end_of_transfer;
       |      |                                 ~~~~
       |      |                                 |
       |      |                                 (7) ...to here
       |......
       |  633 |         msg->status =3D ret;
       |      |         ~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (8) use of uninitialized value 'ret' he=
re
       |

vim +/ret +633 drivers/spi/spi-stm32-qspi.c

b051161f44d414e Patrice Chotard 2022-08-16  563  =

b051161f44d414e Patrice Chotard 2022-08-16  564  static int stm32_qspi_tran=
sfer_one_message(struct spi_controller *ctrl,
b051161f44d414e Patrice Chotard 2022-08-16  565  					   struct spi_message=
 *msg)
b051161f44d414e Patrice Chotard 2022-08-16  566  {
b051161f44d414e Patrice Chotard 2022-08-16  567  	struct stm32_qspi *qspi =
=3D spi_controller_get_devdata(ctrl);
b051161f44d414e Patrice Chotard 2022-08-16  568  	struct spi_transfer *tran=
sfer;
b051161f44d414e Patrice Chotard 2022-08-16  569  	struct spi_device *spi =
=3D msg->spi;
b051161f44d414e Patrice Chotard 2022-08-16  570  	struct spi_mem_op op;
b051161f44d414e Patrice Chotard 2022-08-16  571  	int ret;
b051161f44d414e Patrice Chotard 2022-08-16  572  =

b051161f44d414e Patrice Chotard 2022-08-16  573  	if (!spi->cs_gpiod)
b051161f44d414e Patrice Chotard 2022-08-16  574  		return -EOPNOTSUPP;
b051161f44d414e Patrice Chotard 2022-08-16  575  =

b051161f44d414e Patrice Chotard 2022-08-16  576  	mutex_lock(&qspi->lock);
b051161f44d414e Patrice Chotard 2022-08-16  577  =

b051161f44d414e Patrice Chotard 2022-08-16  578  	gpiod_set_value_cansleep(=
spi->cs_gpiod, true);
b051161f44d414e Patrice Chotard 2022-08-16  579  =

b051161f44d414e Patrice Chotard 2022-08-16  580  	list_for_each_entry(trans=
fer, &msg->transfers, transfer_list) {
b051161f44d414e Patrice Chotard 2022-08-16  581  		u8 dummy_bytes =3D 0;
b051161f44d414e Patrice Chotard 2022-08-16  582  =

b051161f44d414e Patrice Chotard 2022-08-16  583  		memset(&op, 0, sizeof(op=
));
b051161f44d414e Patrice Chotard 2022-08-16  584  =

b051161f44d414e Patrice Chotard 2022-08-16  585  		dev_dbg(qspi->dev, "tx_b=
uf:%p tx_nbits:%d rx_buf:%p rx_nbits:%d len:%d dummy_data:%d\n",
b051161f44d414e Patrice Chotard 2022-08-16  586  			transfer->tx_buf, trans=
fer->tx_nbits,
b051161f44d414e Patrice Chotard 2022-08-16  587  			transfer->rx_buf, trans=
fer->rx_nbits,
b051161f44d414e Patrice Chotard 2022-08-16  588  			transfer->len, transfer=
->dummy_data);
b051161f44d414e Patrice Chotard 2022-08-16  589  =

b051161f44d414e Patrice Chotard 2022-08-16  590  		/*
b051161f44d414e Patrice Chotard 2022-08-16  591  		 * QSPI hardware support=
s dummy bytes transfer.
b051161f44d414e Patrice Chotard 2022-08-16  592  		 * If current transfer i=
s dummy byte, merge it with the next
b051161f44d414e Patrice Chotard 2022-08-16  593  		 * transfer in order to =
take into account QSPI block constraint
b051161f44d414e Patrice Chotard 2022-08-16  594  		 */
b051161f44d414e Patrice Chotard 2022-08-16  595  		if (transfer->dummy_data=
) {
b051161f44d414e Patrice Chotard 2022-08-16  596  			op.dummy.buswidth =3D t=
ransfer->tx_nbits;
b051161f44d414e Patrice Chotard 2022-08-16  597  			op.dummy.nbytes =3D tra=
nsfer->len;
b051161f44d414e Patrice Chotard 2022-08-16  598  			dummy_bytes =3D transfe=
r->len;
b051161f44d414e Patrice Chotard 2022-08-16  599  =

b051161f44d414e Patrice Chotard 2022-08-16  600  			/* if happens, means th=
at message is not correctly built */
b051161f44d414e Patrice Chotard 2022-08-16  601  			if (list_is_last(&trans=
fer->transfer_list, &msg->transfers))
b051161f44d414e Patrice Chotard 2022-08-16  602  				goto end_of_transfer;
b051161f44d414e Patrice Chotard 2022-08-16  603  =

b051161f44d414e Patrice Chotard 2022-08-16  604  			transfer =3D list_next_=
entry(transfer, transfer_list);
b051161f44d414e Patrice Chotard 2022-08-16  605  		}
b051161f44d414e Patrice Chotard 2022-08-16  606  =

b051161f44d414e Patrice Chotard 2022-08-16  607  		op.data.nbytes =3D trans=
fer->len;
b051161f44d414e Patrice Chotard 2022-08-16  608  =

b051161f44d414e Patrice Chotard 2022-08-16  609  		if (transfer->rx_buf) {
b051161f44d414e Patrice Chotard 2022-08-16  610  			qspi->fmode =3D CCR_FMO=
DE_INDR;
b051161f44d414e Patrice Chotard 2022-08-16  611  			op.data.buswidth =3D tr=
ansfer->rx_nbits;
b051161f44d414e Patrice Chotard 2022-08-16  612  			op.data.dir =3D SPI_MEM=
_DATA_IN;
b051161f44d414e Patrice Chotard 2022-08-16  613  			op.data.buf.in =3D tran=
sfer->rx_buf;
b051161f44d414e Patrice Chotard 2022-08-16  614  		} else {
b051161f44d414e Patrice Chotard 2022-08-16  615  			qspi->fmode =3D CCR_FMO=
DE_INDW;
b051161f44d414e Patrice Chotard 2022-08-16  616  			op.data.buswidth =3D tr=
ansfer->tx_nbits;
b051161f44d414e Patrice Chotard 2022-08-16  617  			op.data.dir =3D SPI_MEM=
_DATA_OUT;
b051161f44d414e Patrice Chotard 2022-08-16  618  			op.data.buf.out =3D tra=
nsfer->tx_buf;
b051161f44d414e Patrice Chotard 2022-08-16  619  		}
b051161f44d414e Patrice Chotard 2022-08-16  620  =

b051161f44d414e Patrice Chotard 2022-08-16  621  		ret =3D stm32_qspi_send(=
spi, &op);
b051161f44d414e Patrice Chotard 2022-08-16  622  		if (ret)
b051161f44d414e Patrice Chotard 2022-08-16  623  			goto end_of_transfer;
b051161f44d414e Patrice Chotard 2022-08-16  624  =

b051161f44d414e Patrice Chotard 2022-08-16  625  		msg->actual_length +=3D =
transfer->len + dummy_bytes;
b051161f44d414e Patrice Chotard 2022-08-16  626  	}
b051161f44d414e Patrice Chotard 2022-08-16  627  =

b051161f44d414e Patrice Chotard 2022-08-16  628  end_of_transfer:
b051161f44d414e Patrice Chotard 2022-08-16  629  	gpiod_set_value_cansleep(=
spi->cs_gpiod, false);
b051161f44d414e Patrice Chotard 2022-08-16  630  =

b051161f44d414e Patrice Chotard 2022-08-16  631  	mutex_unlock(&qspi->lock);
b051161f44d414e Patrice Chotard 2022-08-16  632  =

b051161f44d414e Patrice Chotard 2022-08-16 @633  	msg->status =3D ret;
b051161f44d414e Patrice Chotard 2022-08-16  634  	spi_finalize_current_mess=
age(ctrl);
b051161f44d414e Patrice Chotard 2022-08-16  635  =

b051161f44d414e Patrice Chotard 2022-08-16  636  	return ret;
b051161f44d414e Patrice Chotard 2022-08-16  637  }
b051161f44d414e Patrice Chotard 2022-08-16  638  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7809780090375541751==--

