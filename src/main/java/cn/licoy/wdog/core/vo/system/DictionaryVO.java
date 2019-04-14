package cn.licoy.wdog.core.vo.system;

import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;

import java.util.List;

@Data
public class DictionaryVO {

    private String id;

    private String parentId;	//

    private String dictCode;	//

    private String dictName;	//

    @TableField(exist = false)
    private List<DictionaryVO> children;
}
