/* Simple linker script for the ucore kernel.
   See the GNU ld 'info' manual ("info ld") to learn the syntax. */

OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH(i386)
ENTRY(kern_entry)

SECTIONS {
    /* Load the kernel at this address: "." means the current address */
    /* 在lab1当中，本行代码写作.=0x100000，说明ld工具形成的ucore起始虚拟地址从0x100000开始。
    由于ucore的物理地址页式0x100000，故映射关系为lab1： virt addr = linear addr = phy addr。
    而在此，lab2中通过ld工具形成的ucore的起始虚拟地址从0xC0100000开始，
    入口函数为kern_entry函数（在kern/init/entry.S中）*/
    /* 第一个阶段：boot/bootasm.S start -->> kern_\entry函数，映射关系与实验1相同；
       第二个阶段：kern_\entry函数 -->> kern/mm/pmm.c enable_page函数，更新段映射，
            vir addr-0xC0000000 = linear addr = physical addr；
       第三个阶段：enable_page函数 -->>kern/mm/pmm.c gdt_init函数，启动页映射，但并未更新，
            virt addr - 0xC0000000 = linear addr  = phy addr + 0xC0000000 # 物理地址在0~4MB之外的三者映射关系
            virt addr - 0xC0000000 = linear addr  = phy addr # 物理地址在0~4MB之内的三者映射关系
       第四个阶段：gdt_init -->> ，第三次更新段映射，并且取消了临时映射关系，
            virt addr = linear addr = phy addr + 0xC0000000*/
    . = 0xC0100000;

    .text : {
        *(.text .stub .text.* .gnu.linkonce.t.*)
    }

    PROVIDE(etext = .); /* Define the 'etext' symbol to this value */

    .rodata : {
        *(.rodata .rodata.* .gnu.linkonce.r.*)
    }

    /* Include debugging information in kernel memory */
    .stab : {
        PROVIDE(__STAB_BEGIN__ = .);
        *(.stab);
        PROVIDE(__STAB_END__ = .);
        BYTE(0)     /* Force the linker to allocate space
                   for this section */
    }

    .stabstr : {
        PROVIDE(__STABSTR_BEGIN__ = .);
        *(.stabstr);
        PROVIDE(__STABSTR_END__ = .);
        BYTE(0)     /* Force the linker to allocate space
                   for this section */
    }

    /* Adjust the address for the data segment to the next page */
    . = ALIGN(0x1000);

    /* The data segment */
    .data : {
        *(.data)
    }

    . = ALIGN(0x1000);
    .data.pgdir : {
        *(.data.pgdir)
    }

    PROVIDE(edata = .);

    .bss : {
        *(.bss)
    }

    PROVIDE(end = .);

    /DISCARD/ : {
        *(.eh_frame .note.GNU-stack)
    }
}
