Content-Type: multipart/mixed; boundary="===============2179556942245045491=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC 2/5] serial: core: Add framework to allow NMI aware serial drivers
Date: Sat, 01 Aug 2020 19:15:49 +0800
Message-ID: <202008011912.CaU8Mrmq%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2179556942245045491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
References: <1595333413-30052-3-git-send-email-sumit.garg@linaro.org>
TO: Sumit Garg <sumit.garg@linaro.org>

Hi Sumit,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.8-rc5]
[cannot apply to tty/tty-testing usb/usb-testing kgdb/kgdb-next v5.8-rc6 ne=
xt-20200731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sumit-Garg/Introduce-NMI-a=
ware-serial-drivers/20200721-201307
base:    11ba468877bb23f28956a35e896356252d63c983
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
compiler: mips-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/tty/serial/serial_core.c:793:6: warning: Variable 'ret' is reass=
igned a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/tty/serial/serial_core.c:761:0: note: Variable 'ret' is reassign=
ed a value before the old one has been used.
    int ret =3D -ENODEV;
   ^
   drivers/tty/serial/serial_core.c:793:6: note: Variable 'ret' is reassign=
ed a value before the old one has been used.
    ret =3D 0;
        ^
   drivers/tty/serial/serial_core.c:982:9: warning: Variable 'retval' is re=
assigned a value before the old one has been used. [redundantAssignment]
    retval =3D 0;
           ^
   drivers/tty/serial/serial_core.c:887:10: note: Variable 'retval' is reas=
signed a value before the old one has been used.
     retval =3D -EBUSY;
            ^
   drivers/tty/serial/serial_core.c:982:9: note: Variable 'retval' is reass=
igned a value before the old one has been used.
    retval =3D 0;
           ^
   drivers/tty/serial/serial_core.c:1119:6: warning: Variable 'ret' is reas=
signed a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/tty/serial/serial_core.c:1110:0: note: Variable 'ret' is reassig=
ned a value before the old one has been used.
    int ret =3D -EIO;
   ^
   drivers/tty/serial/serial_core.c:1119:6: note: Variable 'ret' is reassig=
ned a value before the old one has been used.
    ret =3D 0;
        ^
   drivers/tty/serial/serial_core.c:2576:9: warning: Variable 'retval' is r=
eassigned a value before the old one has been used. [redundantAssignment]
    retval =3D tty_register_driver(normal);
           ^
   drivers/tty/serial/serial_core.c:2534:0: note: Variable 'retval' is reas=
signed a value before the old one has been used.
    int i, retval =3D -ENOMEM;
   ^
   drivers/tty/serial/serial_core.c:2576:9: note: Variable 'retval' is reas=
signed a value before the old one has been used.
    retval =3D tty_register_driver(normal);
           ^
   drivers/tty/serial/serial_core.c:212:3: warning: Local variable __uport =
shadows outer variable [shadowVar]
     uart_port_unlock(uport, flags);
     ^
   drivers/tty/serial/serial_core.c:208:2: note: Shadowed declaration
    uart_port_lock(state, flags);
    ^
   drivers/tty/serial/serial_core.c:212:3: note: Shadow variable
     uart_port_unlock(uport, flags);
     ^
   drivers/tty/serial/serial_core.c:214:3: warning: Local variable __uport =
shadows outer variable [shadowVar]
     uart_port_unlock(uport, flags);
     ^
   drivers/tty/serial/serial_core.c:208:2: note: Shadowed declaration
    uart_port_lock(state, flags);
    ^
   drivers/tty/serial/serial_core.c:214:3: note: Shadow variable
     uart_port_unlock(uport, flags);
     ^
   drivers/tty/serial/serial_core.c:2368:17: warning: Local variable flags =
shadows outer variable [shadowVar]
     unsigned long flags;
                   ^
   drivers/tty/serial/serial_core.c:2344:15: note: Shadowed declaration
    unsigned int flags;
                 ^
   drivers/tty/serial/serial_core.c:2368:17: note: Shadow variable
     unsigned long flags;
                   ^
>> drivers/tty/serial/serial_core.c:3393:9: warning: Identical condition 'r=
et', second condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/tty/serial/serial_core.c:3384:6: note: first condition
    if (ret)
        ^
   drivers/tty/serial/serial_core.c:3393:9: note: second condition
    return ret;
           ^

# https://github.com/0day-ci/linux/commit/b5d428ea45682ebe36419c4ea685b5b6f=
093d75e
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout b5d428ea45682ebe36419c4ea685b5b6f093d75e
vim +/ret +3393 drivers/tty/serial/serial_core.c

b5d428ea45682eb Sumit Garg 2020-07-21  3378  =

b5d428ea45682eb Sumit Garg 2020-07-21  3379  int uart_nmi_state_init(struct=
 uart_port *port)
b5d428ea45682eb Sumit Garg 2020-07-21  3380  {
b5d428ea45682eb Sumit Garg 2020-07-21  3381  	int ret;
b5d428ea45682eb Sumit Garg 2020-07-21  3382  =

b5d428ea45682eb Sumit Garg 2020-07-21  3383  	ret =3D kfifo_alloc(&port->nm=
i_state.rx_fifo, 256, GFP_KERNEL);
b5d428ea45682eb Sumit Garg 2020-07-21  3384  	if (ret)
b5d428ea45682eb Sumit Garg 2020-07-21  3385  		return ret;
b5d428ea45682eb Sumit Garg 2020-07-21  3386  =

b5d428ea45682eb Sumit Garg 2020-07-21  3387  	init_irq_work(&port->nmi_stat=
e.rx_work, uart_nmi_rx_work);
b5d428ea45682eb Sumit Garg 2020-07-21  3388  	init_irq_work(&port->nmi_stat=
e.tx_work, uart_nmi_tx_work);
b5d428ea45682eb Sumit Garg 2020-07-21  3389  	init_irq_work(&port->nmi_stat=
e.sysrq_sak_work, uart_nmi_sak_work);
b5d428ea45682eb Sumit Garg 2020-07-21  3390  #ifdef CONFIG_MAGIC_SYSRQ_SERI=
AL
b5d428ea45682eb Sumit Garg 2020-07-21  3391  	init_irq_work(&port->nmi_stat=
e.sysrq_toggle_work, uart_nmi_toggle_work);
b5d428ea45682eb Sumit Garg 2020-07-21  3392  #endif
b5d428ea45682eb Sumit Garg 2020-07-21 @3393  	return ret;
b5d428ea45682eb Sumit Garg 2020-07-21  3394  }
b5d428ea45682eb Sumit Garg 2020-07-21  3395  EXPORT_SYMBOL_GPL(uart_nmi_sta=
te_init);
b5d428ea45682eb Sumit Garg 2020-07-21  3396  #endif
b5d428ea45682eb Sumit Garg 2020-07-21  3397  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2179556942245045491==--

