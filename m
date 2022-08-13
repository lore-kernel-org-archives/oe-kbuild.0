Content-Type: multipart/mixed; boundary="===============6748067531051136874=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/irqchip/irq-stm32-exti.c:719 stm32_exti_h_domain_alloc() warn: variable dereferenced before check 'host_data->drv_data' (see line 707)
Date: Sat, 13 Aug 2022 17:42:41 +0800
Message-ID: <202208131739.gJvcs9ls-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6748067531051136874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Antonio Borneo <antonio.borneo@foss.st.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: c297493336b7bc0c12ced484a9e61d04ec2d9403 irqchip/stm32-exti: Simpli=
fy irq description table
date:   5 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-m041-20220812 (https://download.01.org/0day-ci/archi=
ve/20220813/202208131739.gJvcs9ls-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/irqchip/irq-stm32-exti.c:719 stm32_exti_h_domain_alloc() warn: vari=
able dereferenced before check 'host_data->drv_data' (see line 707)

vim +719 drivers/irqchip/irq-stm32-exti.c

9d6a5fe1757cbbd9 Alexandre Torgue 2020-07-17  691  =

927abfc4461e7fd7 Ludovic Barre    2018-04-26  692  static int stm32_exti_h_=
domain_alloc(struct irq_domain *dm,
927abfc4461e7fd7 Ludovic Barre    2018-04-26  693  				     unsigned int vi=
rq,
927abfc4461e7fd7 Ludovic Barre    2018-04-26  694  				     unsigned int nr=
_irqs, void *data)
927abfc4461e7fd7 Ludovic Barre    2018-04-26  695  {
927abfc4461e7fd7 Ludovic Barre    2018-04-26  696  	struct stm32_exti_host_=
data *host_data =3D dm->host_data;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  697  	struct stm32_exti_chip_=
data *chip_data;
c297493336b7bc0c Antonio Borneo   2022-06-06  698  	u8 desc_irq;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  699  	struct irq_fwspec *fwsp=
ec =3D data;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  700  	struct irq_fwspec p_fws=
pec;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  701  	irq_hw_number_t hwirq;
9d6a5fe1757cbbd9 Alexandre Torgue 2020-07-17  702  	int bank;
ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  703  	u32 event_trg;
ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  704  	struct irq_chip *chip;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  705  =

927abfc4461e7fd7 Ludovic Barre    2018-04-26  706  	hwirq =3D fwspec->param=
[0];
c16ae609214e8356 Antonio Borneo   2022-06-06 @707  	if (hwirq >=3D host_dat=
a->drv_data->bank_nr * IRQS_PER_BANK)
c16ae609214e8356 Antonio Borneo   2022-06-06  708  		return -EINVAL;
c16ae609214e8356 Antonio Borneo   2022-06-06  709  =

927abfc4461e7fd7 Ludovic Barre    2018-04-26  710  	bank  =3D hwirq / IRQS_=
PER_BANK;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  711  	chip_data =3D &host_dat=
a->chips_data[bank];
927abfc4461e7fd7 Ludovic Barre    2018-04-26  712  =

ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  713  	event_trg =3D readl_rel=
axed(host_data->base + chip_data->reg_bank->trg_ofst);
ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  714  	chip =3D (event_trg & B=
IT(hwirq % IRQS_PER_BANK)) ?
ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  715  	       &stm32_exti_h_ch=
ip : &stm32_exti_h_chip_direct;
ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  716  =

ce4ef8f9f2abcf10 Antonio Borneo   2022-06-06  717  	irq_domain_set_hwirq_an=
d_chip(dm, virq, hwirq, chip, chip_data);
c297493336b7bc0c Antonio Borneo   2022-06-06  718  =

c297493336b7bc0c Antonio Borneo   2022-06-06 @719  	if (!host_data->drv_dat=
a || !host_data->drv_data->desc_irqs)
c297493336b7bc0c Antonio Borneo   2022-06-06  720  		return -EINVAL;
c297493336b7bc0c Antonio Borneo   2022-06-06  721  =

c297493336b7bc0c Antonio Borneo   2022-06-06  722  	desc_irq =3D host_data-=
>drv_data->desc_irqs[hwirq];
c297493336b7bc0c Antonio Borneo   2022-06-06  723  	if (desc_irq !=3D EXTI_=
INVALID_IRQ) {
927abfc4461e7fd7 Ludovic Barre    2018-04-26  724  		p_fwspec.fwnode =3D dm=
->parent->fwnode;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  725  		p_fwspec.param_count =
=3D 3;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  726  		p_fwspec.param[0] =3D =
GIC_SPI;
c297493336b7bc0c Antonio Borneo   2022-06-06  727  		p_fwspec.param[1] =3D =
desc_irq;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  728  		p_fwspec.param[2] =3D =
IRQ_TYPE_LEVEL_HIGH;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  729  =

927abfc4461e7fd7 Ludovic Barre    2018-04-26  730  		return irq_domain_allo=
c_irqs_parent(dm, virq, 1, &p_fwspec);
927abfc4461e7fd7 Ludovic Barre    2018-04-26  731  	}
927abfc4461e7fd7 Ludovic Barre    2018-04-26  732  =

927abfc4461e7fd7 Ludovic Barre    2018-04-26  733  	return 0;
927abfc4461e7fd7 Ludovic Barre    2018-04-26  734  }
927abfc4461e7fd7 Ludovic Barre    2018-04-26  735  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6748067531051136874==--

