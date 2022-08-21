Content-Type: multipart/mixed; boundary="===============7224237638230739136=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable: entity->id [uninitvar]
Date: Sun, 21 Aug 2022 15:32:56 +0800
Message-ID: <202208211508.azwHR7An-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7224237638230739136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable: entity->id=
 [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: 46e8f49ed7b3063f51e28f3ea2084b3da29c1503 net: wwan: t7xx: Introduce=
 power management
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 46e8f49ed7b3063f51e28f3ea2084b3da29c1503
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wwan/t7xx/t7xx_pci.c:124:15: warning: Uninitialized variable=
: entity->id [uninitvar]
     if (entity->id =3D=3D pm_entity->id) {
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:141:15: warning: Uninitialized variable=
: entity->id [uninitvar]
     if (entity->id =3D=3D pm_entity->id) {
                 ^
>> drivers/net/wwan/t7xx/t7xx_pci.c:382:15: warning: Uninitialized variable=
: entity->resume_early [uninitvar]
     if (entity->resume_early)
                 ^
   drivers/net/wwan/t7xx/t7xx_pci.c:309:42: note: Assuming condition is fal=
se
    if (atomic_read(&t7xx_dev->md_pm_state) <=3D MTK_PM_INIT) {
                                            ^
   drivers/net/wwan/t7xx/t7xx_pci.c:382:15: note: Uninitialized variable: e=
ntity->resume_early
     if (entity->resume_early)
                 ^
--
>> drivers/net/wwan/t7xx/t7xx_port_proxy.c:325:33: warning: Uninitialized v=
ariable: port_conf [uninitvar]
     if (queue->md_ctrl->hif_id =3D=3D port_conf->path_id &&
                                   ^
   drivers/net/wwan/t7xx/t7xx_port_proxy.c:323:48: note: Assignment 'port_c=
onf=3Dport->port_conf', assigned value is <Uninit>
     const struct t7xx_port_conf *port_conf =3D port->port_conf;
                                                  ^
   drivers/net/wwan/t7xx/t7xx_port_proxy.c:325:33: note: Uninitialized vari=
able: port_conf
     if (queue->md_ctrl->hif_id =3D=3D port_conf->path_id &&
                                   ^
>> drivers/net/wwan/t7xx/t7xx_port_proxy.c:327:11: warning: Uninitialized v=
ariables: port.port_conf, port.wwan_port, port.t7xx_dev, port.dev, port.usa=
ge_cnt, port.entry, port.queue_entry, port.rx_skb_list, port.port_update_lo=
ck, port.rx_wq, port.rx_length_th, port.chan_enable, port.thread [uninitvar]
      return port;
             ^

vim +124 drivers/net/wwan/t7xx/t7xx_pci.c

46e8f49ed7b306 Haijun Liu 2022-05-06  117  =

46e8f49ed7b306 Haijun Liu 2022-05-06  118  int t7xx_pci_pm_entity_register(=
struct t7xx_pci_dev *t7xx_dev, struct md_pm_entity *pm_entity)
46e8f49ed7b306 Haijun Liu 2022-05-06  119  {
46e8f49ed7b306 Haijun Liu 2022-05-06  120  	struct md_pm_entity *entity;
46e8f49ed7b306 Haijun Liu 2022-05-06  121  =

46e8f49ed7b306 Haijun Liu 2022-05-06  122  	mutex_lock(&t7xx_dev->md_pm_ent=
ity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  123  	list_for_each_entry(entity, &t7=
xx_dev->md_pm_entities, entity) {
46e8f49ed7b306 Haijun Liu 2022-05-06 @124  		if (entity->id =3D=3D pm_entit=
y->id) {
46e8f49ed7b306 Haijun Liu 2022-05-06  125  			mutex_unlock(&t7xx_dev->md_pm=
_entity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  126  			return -EEXIST;
46e8f49ed7b306 Haijun Liu 2022-05-06  127  		}
46e8f49ed7b306 Haijun Liu 2022-05-06  128  	}
46e8f49ed7b306 Haijun Liu 2022-05-06  129  =

46e8f49ed7b306 Haijun Liu 2022-05-06  130  	list_add_tail(&pm_entity->entit=
y, &t7xx_dev->md_pm_entities);
46e8f49ed7b306 Haijun Liu 2022-05-06  131  	mutex_unlock(&t7xx_dev->md_pm_e=
ntity_mtx);
46e8f49ed7b306 Haijun Liu 2022-05-06  132  	return 0;
46e8f49ed7b306 Haijun Liu 2022-05-06  133  }
46e8f49ed7b306 Haijun Liu 2022-05-06  134  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7224237638230739136==--

