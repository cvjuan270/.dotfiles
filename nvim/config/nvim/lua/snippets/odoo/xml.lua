local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- ls.add_snippets("xml", {
  --   s("name=", { t('name="'), i(1), t('"') }),
  -- }),
  -- Campos en una vista
  s("xmlh", fmt([[<?xml version="1.0" encoding="utf-8"?>]], {}, {})),
  s("ofie", fmt([[<field name="{}" >{}</field>]], { i(1, "name"), i(2, "value") })),
  s("ofiec", fmt([[<field name="{}" />]], { i(1, "name") })),
  s(
    "oreco",
    fmt(
      [[
          <record id="{}" model="{}">
            <field name="{}">{}</field>
            <field name="{}">{}</field>
            <field name="{}" type="{}">
              {}
            </field>
        </record>
  ]],
      {
        i(1, "recorf_id"),
        i(2, "ir.ui.view"),
        i(3, "name"),
        i(4, "record.name"),
        i(5, "model"),
        i(6, "model.name"),
        i(7, "arch"),
        i(8, "xml"),
        i(9, ""),
      },
      {}
    )
  ),
  s(
    "ofields",
    fmt(
      [[
        <group>
            <field name="{}" />
            <field name="{}" widget="{}" options="{}" />
        </group>
      ]],
      {
        i(1, "field1"),
        i(2, "field2"),
        i(3, "selection"),
        i(0, "{'no_create': True}"),
      }
    )
  ),

  s(
    "otree",
    fmt(
      [[
        <record id="{}" model="{}">
            <field name="name">{}</field>
            <field name="model">{}</field>
            <field name="arch" type="xml">
                <tree multi_edit="False" sample="False" string="{}">
                    <field name="{}"></field>
                </tree>
            </field>
        </record>
      ]],
      {
        i(1, "view_model_name_tree"),
        i(2, "ir.ui.view"),
        i(3, "model.name.tree"),
        i(4, "model.name"),
        i(5, "string"),
        i(6, "fiold_name"),
      }
    )
  ),
}
